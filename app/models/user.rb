class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :sent_trade_offers, class_name: 'TradeOffer', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_trade_offers, class_name: 'TradeOffer', foreign_key: 'receiver_id', dependent: :destroy
end
