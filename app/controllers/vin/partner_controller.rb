class Vin::PartnerController < ApplicationController
respond_to :json

  # GET /partner
  def index
    sub = Subscriber.joins(:shipments).where(shipments: {status: "scheduled"})
    render json: sub
  end

end