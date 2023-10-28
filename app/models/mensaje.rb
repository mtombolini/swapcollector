class Mensaje < ApplicationRecord
  belongs_to :Chat
  belongs_to :user
end
