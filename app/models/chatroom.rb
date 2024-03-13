class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
  # has_one :transaction
end
