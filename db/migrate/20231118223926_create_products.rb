class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :rarity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
