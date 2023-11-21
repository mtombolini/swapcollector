class AddRequestedProductIdToTradeOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :trade_offers, :requested_product_id, :integer
  end
end
