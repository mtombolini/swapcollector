class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :trade_offers_as_requested, class_name: 'TradeOffer', foreign_key: 'requested_product_id', dependent: :destroy
  has_many :trade_offer_items, dependent: :destroy
  has_many :trade_offers_as_offered, through: :trade_offer_items, source: :trade_offer, dependent: :destroy
  has_one_attached :image
end
