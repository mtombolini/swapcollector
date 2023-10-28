class Producto < ApplicationRecord
  has_many :solicitudes
  has_many :reviews
end
