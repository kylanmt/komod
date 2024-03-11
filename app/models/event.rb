class Event < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  has_many :clothes, through: :transactions

  validates :name, presence: true # déterminée par l'équipe komod'
  # validates :type, presence: true # (future toggle list)
end
