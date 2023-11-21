class RenameTradeOferrItemToTradeOfferItem < ActiveRecord::Migration[7.0]
  def change
    rename_table :trade_oferr_items, :trade_offer_items
  end
end
