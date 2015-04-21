class Vin::AdminController < ApplicationController
respond_to :json

  # POST /admin
  def create
    name = params[:name]
    admin = Admin.create({name: name})
    if admin
      render json: { errors: [] }
    else
      render json: { errors: ["Unable to create admin"]}
    end
  end

  # GET /admin
  def index
    admins = Admin.all

    render json: admins
  end

  # PUT /admin/{aid}
  def update
    admin = Admin.find(params[:id])
    name = params[:name]
    admin.update_attribute(:name, name)

    if admin
      render json: admin
    else
      render json: { errors: ["Unable to create admin", admin.errors]}
    end
  end

  # GET /admin/{aid}
  def show
    admin = Admin.find(params[:id])
    render json: admin
  end


  # GET /admin/revenue -> USE CASE REMOVED FROM SCOPE!!!
  # GET /admin/monthly_selection
  # POST /admin/monthly_selection
  # GET /admin/monthly_selection/{mid}

end