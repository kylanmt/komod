class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  has_one :clothe_transaction, dependent: :destroy
end
