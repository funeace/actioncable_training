class Room < ApplicationRecord
  # 
  has_many :entries
  has_many :chats
  has_many :users,through: :entries
end
