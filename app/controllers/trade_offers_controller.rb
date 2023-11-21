class TradeOffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trade_offer, only: %i[ show update destroy ]
  before_action :set_requested_product, only: %i[ new] 

  def new
    @trade_offer = TradeOffer.new
    @offered_products = current_user.products
    @requested_product_id = params[:product_id]
    @available_products = Product.where.not(user_id: current_user.id)
  end

  def create
    @trade_offer = current_user.sent_trade_offers.build(trade_offer_params)

      if @trade_offer.save
        params[:offered_product_ids].each do |product_id|
          @trade_offer.trade_offer_items.create(product_id: product_id)
        end
          params[:requested_product_ids].each do |product_id|
            @trade_offer.requested_trade_offer_items.create(product_id: product_id)
          end

          redirect_to @trade_offer, notice: "La oferta ha sido creada"
      else
        render :new
      end
  end

  def show
  end

  def update
  end

  def destroy
  end

    private

  def set_trade_offer
    @trade_offer = TradeOffer.find(params[:id])
  end

  def trade_offer_params
    params.require(:trade_offer).permit(:receiver_id, :message, offered_product_ids: [])
  end

  def set_requested_product
    @requested_product = Product.find_by(id: params[:product_id])
    unless @requested_product
      redirect_to root_path, alert: "No se ha encontrado el producto solicitado"
    end
  end

        
end
