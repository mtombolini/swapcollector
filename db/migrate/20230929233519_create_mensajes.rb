class CreateMensajes < ActiveRecord::Migration[7.0]
  def change
    create_table :mensajes do |t|
      t.string :Contenido
      t.datetime :Fecha

      t.timestamps
    end
  end
end
