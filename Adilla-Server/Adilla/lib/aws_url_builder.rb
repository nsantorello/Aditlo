module AwsUrlBuilder
	def thumb_url filename
		AWS_BUCKETS_THUMBS_URL + filename
	end
	
	def adil_url filename
		AWS_BUCKETS_ADILS_URL + filename
	end
end