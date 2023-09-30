class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :CategoriaGeneral
      t.string :SubCategoria
      t.string :Nombre
      t.string :Descripcion
      t.boolean :Estado
      t.float :Precio

      t.timestamps
    end
  end
end
