class CreateTradeOferrItems < ActiveRecord::Migration[7.0]
  def change
    create_table :trade_oferr_items do |t|
      t.references :trade_offer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
