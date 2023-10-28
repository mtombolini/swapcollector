class AddUserToSolicitudes < ActiveRecord::Migration[7.0]
  def change
    add_reference :solicitudes, :user, null: false, foreign_key: true
  end
end
