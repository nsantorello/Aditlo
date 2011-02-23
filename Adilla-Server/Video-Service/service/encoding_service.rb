#!/usr/bin/env ruby

require 'rubygems'
require 'right_aws'
require './operations/s3_thumb_operation'
require './operations/s3_video_operation'
require './s3_encoding_process'

# Access constants
AWS_ACCESS_KEY_ID = 'AKIAJJ26WQL3CQ3X73IA'
AWS_SECRET_ACCESS_KEY = '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'

# Connect to SQS
AWS_SQS_VIDENC_QUEUE_NAME = 'Adilla-VideoEncodingJobs'
POLLING_INTERVAL = 10
sqs = RightAws::SqsGen2.new AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
# Grab the video encoding queue.
queue = sqs.queue AWS_SQS_VIDENC_QUEUE_NAME

# Connect to S3
s3 = RightAws::S3.new AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY

while true
	# Pop the next message off the queue.
	message = queue.pop
	
	# If there was a message...
	if (message)
		# Create an encoding process from the body of the message.
	    proc = S3EncodingProcess.create message.body, s3
	    # If the body of the message was well-formed...
	    if (proc)
	    	# Execute the job!
	    	proc.start
	    end
	    # Since we just took something out of the queue, it's likely there's something else in there.
	    # So check right away for a new job.
		next
	else
		# Indicate we've checked, but no success.
		print '.'
	end
	
	# Flush to stdout so we can see progress.
	$stdout.flush
	
	# Wait some time before polling the queue again.
	sleep POLLING_INTERVAL
end