class CreateSolicitudes < ActiveRecord::Migration[7.0]
  def change
    create_table :solicitudes do |t|
      t.string :Producto
      t.string :Descripcion
      t.date :FechaReserva
      t.boolean :Estado
      t.references :user_id, null: false, foreign_key: true
      t.references :producto_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
