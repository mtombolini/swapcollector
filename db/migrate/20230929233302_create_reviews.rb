class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.float :Calificacion
      t.string :Contenido

      t.timestamps
    end
  end
end
