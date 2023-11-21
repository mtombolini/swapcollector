class CreateTradeOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :trade_offers do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status
      t.text :message

      t.timestamps
    end
  end
end
