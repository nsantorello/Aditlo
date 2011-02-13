class AdilsApiController < ApplicationController
  # GET /adils_api
  # GET /adils_api.xml
  def index
    @adils = Adil.all

    respond_to do |format|
      format.json  { render :json => @adils }
    end
  end

  # GET /adils_api/1
  # GET /adils_api/1.xml
  def show
    @adil = Adil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adil }
    end
  end

  # POST /adils_api
  # POST /adils_api.xml
  def create
    @adil = Adil.new(params[:adil])

    respond_to do |format|
      if @adil.save
        format.html { redirect_to(@adil, :notice => 'Adil was successfully created.') }
        format.xml  { render :xml => @adil, :status => :created, :location => @adil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adil.errors, :status => :unprocessable_entity }
      end
    end
  end

end
