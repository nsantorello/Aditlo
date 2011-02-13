include Pseudohash

class AdilsController < ApplicationController

 # GET /today.json
  def today
    @adils = Adil.all

    respond_to do |format|
      format.json  { render :json => @adils }
    end
  end

end
