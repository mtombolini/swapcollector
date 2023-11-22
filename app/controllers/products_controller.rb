class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_product, only: %i[show edit update destroy]

  
  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def new
    @product = Product.new
    
  end

  def edit
  end

  def create     
      @product = Product.new(product_params)
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: "Producto creado exitosamente" }
          format.json { render json: @product, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)

        format.html { redirect_to @product, notice: "Producto actualizado exitosamente" }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
        format.html { redirect_to root_path, notice: "Producto eliminado exitosamente", status: :see_other}
        format.turbo_stream
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :rarity, :image, :user_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
