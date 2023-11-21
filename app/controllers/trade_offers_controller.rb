class TradeOffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trade_offer, only: [:show]

  def new
    @requested_product = Product.find_by(id: params[:product_id])
    @trade_offer = current_user.sent_trade_offers.new(receiver_id: params[:receiver_id], 
                                                      requested_product_id: params[:product_id])
    @offered_products = current_user.products.where.not(id: params[:product_id])
  end

  def create
    @trade_offer = current_user.sent_trade_offers.build(trade_offer_params)
    if @trade_offer.save
      offered_product_ids = trade_offer_params[:offered_product_ids].reject(&:blank?)
      offered_product_ids.each do |product_id|
        @trade_offer.trade_offer_items.create(product_id: product_id)
      end
      redirect_to @trade_offer, notice: "La oferta de intercambio se ha creado correctamente"
    else
      @offered_products = current_user.products.where.not(id: @trade_offer.requested_product_id)
      render :new
    end
  end

  def show
    # @trade_offer = TradeOffer.find(params[:id])
  end

  private

  def set_trade_offer
    @trade_offer = TradeOffer.find(params[:id])
  end

  def trade_offer_params
    params.require(:trade_offer).permit(:receiver_id, :requested_product_id, :message,  offered_product_ids: [])
  end
        
end
