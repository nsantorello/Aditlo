#########################################################################################
# An S3ThumbOperation job message takes the following format (no brackets):
# 	S3ThumbOperation,[dest_bucket],[dest_file],[min_thumb_dimension]
# 
# e.g. "S3ThumbOperation,dl.dev.adil.la,t/4xi9p_104.jpg,104"
#########################################################################################

require_relative 's3_encoding_operation'

class S3ThumbOperation < S3EncodingOperation
	attr_accessor :min_dimension
	
	def S3ThumbOperation.from_str message
		op = S3ThumbOperation.new
		params = message.split ','
		op.dest_bucket = params[1]
		op.dest_file = params[2]
		op.min_dimension = params[3].to_i
		op
	end
	
	def to_s
		"S3ThumbOperation,#{dest_bucket},#{dest_file},#{min_dimension}"
	end
	
	def process
		# Create thumbnail.
		local_dest_file = info.local_src_file  + ".jpg"
		dimensions = "#{min_dimension}x#{min_dimension}"
      	`ffmpeg -itsoffset -1 -y -i #{info.local_src_file} #{info.transpose} -vcodec mjpeg -vframes 1 -an -f rawvideo -s #{dimensions} #{local_dest_file}`
      	
      	# Push to S3.
		info.s3.bucket(dest_bucket).put dest_file, open(local_dest_file)
		# Remove local output file.
		File.delete local_dest_file 
	end
end