class CreateSolicituds < ActiveRecord::Migration[7.0]
  def change
    create_table :solicituds do |t|
      t.string :Producto
      t.string :Descripcion
      t.date :FechaReserva
      t.boolean :Estado

      t.timestamps
    end
  end
end
