include Pseudohash

class AdilsController < ApplicationController
  
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
      	@adil.save
      	
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
