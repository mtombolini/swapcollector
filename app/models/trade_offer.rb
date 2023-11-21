class TradeOffer < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :trade_offer_items
  has_many :offered_products, through: :trade_offer_items, source: :product
end
