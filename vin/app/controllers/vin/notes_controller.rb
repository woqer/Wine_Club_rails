class Vin::NotesController < ApplicationController
respond_to :json

  # GET /vin/sub/:uid/shipments/:sid/notes
  def index

    @subscriber = Subscriber.find(params[:sub_id])

    @package = @subscriber.shipments.find(params[:shipment_id]).package

    notes = @package.note

    render_result({ notes: [notes.to_s] })
  end

  # POST /vin/sub/:uid/shipments/:sid/notes
  def create

    @subscriber = Subscriber.find(params[:sub_id])

    @package = @subscriber.shipments.find(params[:shipment_id]).package

    note = params[:content]

    status = @package.update_attribute(:note, note)

    render_result({ errors: [status ? "" : "Problem updating note"] })
  end

  # GET /vin/sub/:uid/shipments/:sid/notes/:nid
  # Waiting for teacher response on NoteId...
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.json { render json: @shipment }
    end
  end

  # PUT /vin/sub/:uid/shipments/:sid/notes/:nid
  # Waiting for teacher response on NoteId...
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.json { render json: { errors: [] } }
      else
        format.json { render json: @note.errors }
      end
    end
  end

  # DELETE /vin/sub/:uid/shipments/:sid/notes/:nid
  # Waiting for teacher response on NoteId...
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.json { head :no_content }
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