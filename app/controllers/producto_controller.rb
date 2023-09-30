class ProductoController < ApplicationController
    def index
        @productos = Producto.all
    end

    def show
        @producto = Producto.find(params[:id])
    end

    def new
        @producto = Producto.new
    end

    def create
        @producto = Producto.new(producto_params)
        @producto.user = current_user


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
        if @producto.update(producto_params)
            redirect_to @producto, notice: 'Producto actualizado'
        else
            render :edit
        end
    end

    def destroy
        @producto.destroy
        redirect_to root_path, notice: 'Producto eliminado'
    end

    private

    def set_producto
        @producto = Producto.find(params[:id])
    end

    def producto_params
        params.require(:producto).permit(:nombre, :descripcion, :precio, :imagen)
    end
end
