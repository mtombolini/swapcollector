class Chat < ApplicationRecord
    belongs_to :user
    has_many :mensajes
    belongs_to :usuario1, class_name: "User"
    belongs_to :usuario2, class_name: "User"
end
