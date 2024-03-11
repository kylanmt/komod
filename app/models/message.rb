class Message < ApplicationRecord
  has_one :chatroom
  has_many :users

  validates :content, presence: true
end
