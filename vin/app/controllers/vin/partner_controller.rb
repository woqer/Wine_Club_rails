class Vin::PartnerController < ApplicationController
respond_to :json

  # GET /partner
  def index
    render json: { message: "Route-controller OK !!!" }
  end

end