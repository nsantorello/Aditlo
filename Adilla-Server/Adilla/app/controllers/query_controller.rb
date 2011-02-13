class QueryController < ApplicationController
  
  # GET /today.json
  def today
    @adils = Adil.all :limit => 18, :order => 'created_at DESC'

    respond_to do |format|
      format.json  { render :json => @adils }
    end
  end
  
end