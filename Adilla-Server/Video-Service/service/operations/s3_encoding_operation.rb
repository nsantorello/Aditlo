class S3EncodingOperation
	attr_accessor :info, :dest_bucket, :dest_file
	
	def process
		raise "Your class needs to implement the .process method."
	end
	
	def S3EncodingOperation.from_operation_string str
		op_name = (str.split ',')[0]
		if op_name == "S3ThumbOperation"
			S3ThumbOperation.from_str str
		elsif op_name == "S3VideoOperation"
			S3VideoOperation.from_str str
		end
	end
end