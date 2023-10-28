class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :producto
end
