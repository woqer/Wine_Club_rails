class Vin::ShipmentsController < ApplicationController
respond_to :json

  # GET /vin/sub/:uid/shipments
  def index
    subscriber = Subscriber.find(params[:sub_id])
    @shipments = subscriber.shipments

    render json: @shipments.selection_month
  end

  # GET /vin/sub/:uid/shipments/:sid
  def show
    @shipment = Shipment.find(params[:id])

    render json: @shipment.show
  end

  # PUT /vin/sub/:uid/shipments/:sid
  # USE CASE REMOVED FROM SCOPE!!!
  # def update
  #   @shipment = Shipment.find(params[:id])

  #   if @shipment.update_attributes(params[:shipment])
  #     render json: { errors: [] }
  #   else
  #     render json: @shipment.errors
  #   end
  # end

  # GET /vin/sub/:uid/shipments/:sid/notes
  # POST /vin/sub/:uid/shipments/:sid/notes
  # GET /vin/sub/:uid/shipments/:sid/notes/:nid
  # PUT /vin/sub/:uid/shipments/:sid/notes/:nid
  # DELETE /vin/sub/:uid/shipments/:sid/notes/:nid

end