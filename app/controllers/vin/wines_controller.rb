class Vin::WinesController < ApplicationController
respond_to :json

  # GET /vin/sub/:uid/wines
  def index
    if params[:sub_id]
      index_subs
    else
      render json: Wine.all
    end
  end

  # GET /vin/sub/:uid/wines/:wid
  # GET /vin/wines/:wid
  def show
    # NEEDS SOME LOGIC TO CHECK SUBSCRIBER
    # to see if got here from wines of sub/uid/wines
    @wine = Wine.find(params[:id])
    render json: @wine
  end

  # GET /vin/sub/:uid/wines/:wid/rating
  # POST /vin/sub/:uid/wines/:wid/rating
  def rating
    @wine = Wine.find(params[:id])

    if request.get?
      render json: { rating: @wine.rating }
    elsif request.post?
      @wine.update_attribute(:rating, params[:rating])
      render json: { rating: @wine.rating }
    else
      render json: { errors: ["Invalid request"] }
    end
  end

  # GET /vin/sub/:uid/wines/:wid/notes
  # POST /vin/sub/:uid/wines/:wid/notes
  # GET /vin/sub/:uid/wines/:wid/notes/:nid
  # PUT /vin/sub/:uid/wines/:wid/notes/:nid
  # DELETE /vin/sub/:uid/wines/:wid/notes/:nid

  private

  def index_subs
    subscriber = Subscriber.find(params[:sub_id])

    @wines = subscriber.packages.flat_map(&:wine).uniq

    render json: @wines
  end

end