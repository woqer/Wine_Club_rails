class Vin::SubController < ApplicationController
respond_to :json
  
  # POST /vin/sub
  def create
    @address = Address.create(address_params)

    @subscriber = Subscriber.new(subs_params)
    
    @subscriber.address = @address

    already = !@subscriber.save

    if already
      render json: { errors: ["Subscriber already registered!"]}
    else
      render json: @subscriber
    end

  end

  # GET /vin/sub/:uid
  def show
    @subscriber = Subscriber.find(params[:id])

    render json: @subscriber
  end

  # PUT /vin/sub/:uid
  # Update address (use case) was removed from scope, but is already implemented!
  def update
    @subscriber = Subscriber.find(params[:id])

    sub_update = @subscriber.update_attributes(subs_params)
    addr_update = @subscriber.address.update_attributes(address_params)

    if sub_update && addr_update
      render json: { errors: [] }
    else
      render json: @subscriber.errors
    end
  end

  # GET /vin/sub/:uid/search
  def search
    query_str = params[:q]
    @subscriber = Subscriber.find(params[:id])
    wines = @subscriber.packages.wines.search(query_str)
    notes = @subscriber.packages.search(query_str).note
    shipments = @subscriber.shipments.search(query_str)

    render json: { wines: wines, notes: notes, shipments: shipments }
  end

  # GET /vin/sub/:uid/delivery
  def delivery
    @subscriber = Subscriber.find(params[:id])

    render json: { errors: ["Not implemented yet"] }
  end

  # GET /vin/sub/:uid/shipments
  # GET /vin/sub/:uid/shipments/:sid
  # PUT /vin/sub/:uid/shipments/:sid
  # GET /vin/sub/:uid/shipments/:sid/notes
  # POST /vin/sub/:uid/shipments/:sid/notes
  # GET /vin/sub/:uid/shipments/:sid/notes/:nid
  # PUT /vin/sub/:uid/shipments/:sid/notes/:nid
  # DELETE /vin/sub/:uid/shipments/:sid/notes/:nid
  # GET /vin/sub/:uid/wines
  # GET /vin/sub/:uid/wines/:wid
  # GET /vin/sub/:uid/wines/:wid/notes
  # POST /vin/sub/:uid/wines/:wid/notes
  # GET /vin/sub/:uid/wines/:wid/notes/:nid
  # PUT /vin/sub/:uid/wines/:wid/notes/:nid
  # DELETE /vin/sub/:uid/wines/:wid/notes/:nid
  # GET /vin/sub/:uid/wines/:wid/rating
  # POST /vin/sub/:uid/wines/:wid/rating
  # PUT /vin/sub/:uid/delivery -> USE CASE REMOVED FROM SCOPE!!!

  private

  def address_params
    params.require(:subscriber).require(:address).permit(:street, :city, :state, :zip)
  end

  def subs_params
    params.require(:subscriber).permit(:email, :name, :phone, :facebook, :twitter)
  end

end