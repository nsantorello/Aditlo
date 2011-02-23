require 'right_aws'
require 's3_encoding_process'
require 'operations/s3_thumb_operation'
require 'operations/s3_video_operation'

include Pseudohash
include AwsUrlBuilder

class AdilsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  # GET /adils
  # GET /adils.xml
  def index
    @adils = Adil.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adils }
    end
  end

  # GET /adils/1
  # GET /adils/1.xml
  def show
    @adil = Adil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adil }
    end
  end

  # GET /adils/new
  # GET /adils/new.xml
  def new
    @adil = Adil.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adil }
    end
  end

  # GET /adils/1/edit
  def edit
    @adil = Adil.find(params[:id])
  end

  # POST /adils
  # POST /adils.xml
  def create
    @adil = Adil.new(params[:adil])

    respond_to do |format|
      if @adil.save
        # Compute and store pseudohash
      	@adil.pseudohash = Pseudohash.hashify @adil.id
      	
      	# Create URLs to each media component.
      	@adil.video_url = AWS_BUCKETS_ADILS_URL + @adil.pseudohash + ".mp4"
      	@adil.thumb_104 = AWS_BUCKETS_THUMBS_URL + @adil.pseudohash + "_104.jpg"
      	@adil.thumb_208 = AWS_BUCKETS_THUMBS_URL + @adil.pseudohash + "_208.jpg"
      	@adil.save
      	
      	# Push encoding job to SQS video encoding queue.
      	sqs = RightAws::SqsGen2.new AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
      	queue = sqs.queue AWS_SQS_VIDENC_QUEUE_NAME
      	job = encoding_job_from_params params, @adil
      	queue.push job.to_s
      	
        format.html { render :json => @adil }
        format.xml  { render :xml => @adil, :status => :created, :location => @adil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adil.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def encoding_job_from_params params, adil
  	job = S3EncodingProcess.new
	job.src_bucket = params[:src_bucket]
	job.src_file = params[:src_file]
	job.operations = []
	vidop = S3VideoOperation.new
	t104op = S3ThumbOperation.new
	t208op = S3ThumbOperation.new
	vidop.dest_bucket = t104op.dest_bucket = t208op.dest_bucket = AWS_S3_BUCKET
	vidop.dest_file = adil.video_url
	t104op.dest_file = adil.thumb_104
	t104op.min_dimension = 104
	t208op.dest_file = adil.thumb_208
	t208op.min_dimension = 208
	job.operations << vidop << t104op << t208op
	job
  end

  # PUT /adils/1
  # PUT /adils/1.xml
  def update
    @adil = Adil.find(params[:id])

    respond_to do |format|
      if @adil.update_attributes(params[:adil])
        format.html { redirect_to(@adil, :notice => 'Adil was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /adils/1
  # DELETE /adils/1.xml
  def destroy
    @adil = Adil.find(params[:id])
    @adil.destroy

    respond_to do |format|
      format.html { redirect_to(adils_url) }
      format.xml  { head :ok }
    end
  end

end