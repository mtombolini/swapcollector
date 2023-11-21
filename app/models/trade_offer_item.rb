class TradeOfferItem < ApplicationRecord
  belongs_to :trade_offer
  belongs_to :product
end
