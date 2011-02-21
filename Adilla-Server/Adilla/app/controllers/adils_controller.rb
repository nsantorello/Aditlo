require 'aws/s3'

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

		adil_vid_name = @adil.pseudohash + '.mp4'
		full_filename = '/home/ubuntu/tmp/' + @adil.pseudohash + '.tmp'  
		full_adil = '/home/ubuntu/tmp/' + adil_vid_name
		thumb_name = @adil.pseudohash + '_104.jpg'
		full_thumb = '/home/ubuntu/tmp/' + thumb_name
      	File.open(full_filename, 'w+') { |f| f.write(params[:upload].read) }
      	rotation = ["180", "90", "270"].index(`mediainfo #{full_filename} | grep Rotation`[/[0-9]{1,3}/])
      	transpose = (rotation && ((rotation > 0 && '-vf transpose=' + rotation.to_s + '') || '-vf vflip,hflip')) || ""
      	
      	`ffmpeg -i #{full_filename} -y -acodec libfaac -ab 128k -vcodec libx264 #{transpose} -vpre hq -b 512000 -threads 0 #{full_adil}`
      	`ffmpeg -itsoffset -4  -i #{full_filename} #{transpose} -vcodec mjpeg -vframes 1 -an -f rawvideo -s 104x104 #{full_thumb}`
      	
      	@adil.video_url = 'a/' + adil_vid_name
      	@adil.thumb_104 = 't/' + thumb_name
      	
      	
      	# Establish connection to S3
      	AWS::S3::Base.establish_connection! :access_key_id => AWS_ACCESS_KEY_ID, 
      		:secret_access_key => AWS_SECRET_ACCESS_KEY
      	# Upload file to S3, setting it to be available to be read publicly
      	AWS::S3::S3Object.store 'a/' + adil_vid_name, #"thumbs/" + file.original_filename, 
      		open(full_adil), AWS_S3_BUCKET, :access => :public_read
      	AWS::S3::S3Object.store 't/' + thumb_name, #"thumbs/" + file.original_filename, 
      		open(full_thumb), AWS_S3_BUCKET, :access => :public_read
      	
      	@adil.save
      	
      	File.delete full_filename
      	File.delete full_thumb
      	File.delete full_adil
      	
        format.html { redirect_to(@adil, :notice => 'Adil was successfully created.') }
        format.xml  { render :xml => @adil, :status => :created, :location => @adil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adil.errors, :status => :unprocessable_entity }
      end
    end
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