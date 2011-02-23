#########################################################################################
# An S3VideoOperation job message takes the following format (no brackets):
# 	S3VideoOperation,[dest_bucket],[dest_file]
# 
# e.g. "S3VideoOperation,dl.dev.adil.la,a/4xi9p.mp4"
#########################################################################################

require_relative 's3_encoding_operation'

class S3VideoOperation < S3EncodingOperation
	def S3VideoOperation.from_str message
		op = S3VideoOperation.new
		params = message.split ','
		op.dest_bucket = params[1]
		op.dest_file = params[2]
		op
	end
	
	def to_s
		"S3VideoOperation,#{dest_bucket},#{dest_file}"
	end
	
	def process
		# Encode video.
		local_dest_file = info.local_src_file + ".mp4"
		`ffmpeg -i #{info.local_src_file} -y -acodec libfaac -ab 128k -vcodec libx264 #{info.transpose} -vpre hq -b 512000 -threads 0 #{local_dest_file}`
		
		# Push to S3.
		info.s3.bucket(dest_bucket).put dest_file, open(local_dest_file)
		# Remove local output file.
		File.delete local_dest_file 
	end
end