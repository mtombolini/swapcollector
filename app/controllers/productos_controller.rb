class ProductosController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @productos = Producto.all
        render json: @productos
    end

    def show
        @producto = Producto.find(params[:id])
        render json: @producto
    end

    def new
        @producto = Producto.new
    end

    def create
        @producto = Producto.new(producto_params)

        if @producto.save
            redirect_to @producto, notice: 'Producto creado'
        else
            render :new
        end
    end

    def edit
        @producto = Producto.find(params[:id])
    end
    
    def update
        @producto = Producto.find_by_id(params[:id])
        if @producto.nil?
            render json: {error: 'Producto no encontrado'}, status: 404
        elsif @producto.update(producto_params)
            render json: @producto, status: 200
        else
            render json: {error: 'No se pudo actualizar el producto'}, status: 500
        end
    end

    def destroy
        @producto = Producto.find_by_id(params[:id])
        if @producto.nil?
            render json: {error: 'Producto no encontrado'}, status: 404
        else 
            @producto.destroy
            redirect_to productos_path, notice: 'Producto eliminado'
        end
    end

    private
    


    def producto_params
        params.require(:producto).permit(:CategoriaGeneral, :SubCategoria, :Nombre, :Descripcion, :Estado, :Precio)
    end
end
