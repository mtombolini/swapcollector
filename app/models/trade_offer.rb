class TradeOffer < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User'
  belongs_to :requested_product, class_name: 'Product'
  has_many :trade_offer_items, dependent: :destroy
  has_many :offered_products, through: :trade_offer_items, source: :product
  validates :requested_product_id, presence: true
  validates :receiver_id, presence: true
end
