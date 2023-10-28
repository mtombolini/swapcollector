class SolicitudesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Solicitud.all
  end

  def show
    render json: Solicitud.find(params[:id])
  end

  def create 
    solicitud = Solicitud.new(solicitud_params)
      if solicitud.save
        render json: solicitud, status: :created
      else
        render json: solicitud.errors, status: :unprocessable_entity
      end
  end


  def update
    solicitud = Solicitud.find(params[:id])
      if solicitud.update(solicitud_params)
        render json: solicitud, status: :ok
      else
        render json: solicitud.errors, status: :unprocessable_entity
      end
  end

  def destroy
    Solicitud.find(params[:id]).destroy!

      head :no_content
  end

    private

  def solicitud_params
    params.require(:solicitud).permit(:Producto, :Descripcion, :FechaReserva, :Estado, :user_id, :producto_id)
  end
end
