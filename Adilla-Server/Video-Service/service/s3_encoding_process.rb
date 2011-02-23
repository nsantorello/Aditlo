#########################################################################################
# An encoding job message is sent to the queue in the following format (no brackets): 	#
#   [source s3 bucket];[source s3 file];[operation];[operation];...                   	#
# Each operation string takes the form:													#
#   [operation name],[arg1],[arg2],...													#
#																						#
# e.g. "ul.dev.adil.la;x9d9fks3g9ds2oijf298hb3iof29.mov;S3VideoOperation,[params]"		#
#																						#
# For specifics on the params for each operation, see that operation's .rb file.		#
#########################################################################################

require_relative 'operations/s3_encoding_operation'
require_relative 'encoding_info'

class S3EncodingProcess
	attr_accessor :src_bucket, :src_file, :operations, :info
	
	def S3EncodingProcess.create str, s3
		# Create new s3 video process.
		proc = S3EncodingProcess.new
		proc.info = EncodingInfo.new
		proc.info.s3 = s3
		proc.operations = []
		
		# Parse message body.
		parts = str.split ';'
		proc.src_bucket = s3.bucket parts[0]
		proc.src_file = parts[1]
		
		# Parse operations.
		ops = parts[2..parts.count-1]
		ops.each { |op|
			oper = S3EncodingOperation.from_operation_string op
			oper.info = proc.info
			proc.operations << oper
		}
		
		proc
	end
	
	def to_s
		str = "#{src_bucket};#{src_file};"
		operations.each { |op| str += op.to_s + ";" }
		str
	end
	
	def start
		# Get source vid.
		downloaded_src = src_bucket.get src_file
		# Come up with random name for video to save locally.
		o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
		info.local_src_file  =  ((0..25).map{ o[rand(o.length)]  }.join) + File.extname(src_file)
		
		# Write source video to disk.
		File.open(info.local_src_file, 'w+') { |f| f.write(downloaded_src) }
		
		# Get transpose flag for the video.
		info.transpose = get_transpose info.local_src_file
		
		# Perform each operation.
		operations.each { |op| op.process }
		
		# Remove the locally stored source file.
		File.delete(info.local_src_file)
		
		# Remove the source file from S3.
		src_bucket.key(src_file).delete
	end
	
	def get_transpose(filename)
		# Get the rotation and index into the array to get the transpose value.
		rotation = ["180", "90", "270"].index(`mediainfo #{filename} | grep Rotation`[/[0-9]{1,3}/])
		# If rotation is nil, no transpose is necessary.  If it's 0, we do a 
		# vflip then hflip, and if it's 1 or 2 we use the transpose filter.
		transpose = (rotation && ((rotation > 0 && '-vf transpose=' + rotation.to_s + '') || '-vf vflip,hflip')) || ""
	end
end