class Vin::NotesController < ApplicationController
respond_to :json

  # GET /vin/sub/:uid/shipments/:sid/notes
  def index

    @subscriber = Subscriber.find(params[:sub_id])

    # @package = Shipment.for_subscriber.find(params[:shipment_id]).package

    notes = Shipment.for_subscriber(@subscriber).find(params[:shipment_id]).package.note

    render_result({ id: params[:shipment_id], notes: [notes.to_s] })

    # render json: { notes: [notes.to_s] }
  end

  # POST /vin/sub/:uid/shipments/:sid/notes
  def create

    @subscriber = Subscriber.find(params[:sub_id])

    @package = Shipment.for_subscriber(@subscriber).find(params[:shipment_id]).package

    note = params[:content]

    status = @package.update_attribute(:note, note)

    render_result({ errors: [status ? "" : "Problem updating note"] })
    # render json: { errors: [status ? "" : "Problem updating note"] }
  end

  # GET /vin/sub/:uid/shipments/:sid/notes/:nid
  # Waiting for teacher response on NoteId...
  def show
    shipment = Shipment.for_subscriber(Subscriber.find(params[:sub_id])).find(params[:id])
    package = shipment.package
    note = package.note
    id = package.id
    date = shipment.date.strftime("%d-%b-%Y")

    render json: { notes: [{ id: id, date: date, content: note }] }
  end

  # PUT /vin/sub/:uid/shipments/:sid/notes/:nid
  # Waiting for teacher response on NoteId...
  def update
    shipment = Shipment.for_subscriber(Subscriber.find(params[:sub_id])).find(params[:id])
    package = shipment.package
    content = params[:content]
    
    if package.update_attributes(note: content)
      render json: { errors: [] }
    else
      render json: package.errors
    end
  end

  # DELETE /vin/sub/:uid/shipments/:sid/notes/:nid
  # Waiting for teacher response on NoteId...
  def destroy
    shipment = Shipment.for_subscriber(Subscriber.find(params[:sub_id])).find(params[:id])
    package = shipment.package
    
    if package.update_attributes(note: nil)
      render json: { errors: [] }
    else
      render json: package.errors
    end
  end

  private

  def render_result(response={ errors: [] })
    if @subscriber.nil?
      render json: { errors: ["Invalid subscriber ID"] }
    elsif @package.nil?
      render json: { errors: ["Invalid shipment ID"] }
    else
      render json: response
    end  
  end

end