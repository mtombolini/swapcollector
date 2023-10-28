class Producto < ApplicationRecord
    has_many :solicituds
    has_many :reviews
end
