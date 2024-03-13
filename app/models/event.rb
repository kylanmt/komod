class Event < ApplicationRecord
  has_many :clothe_transactions
  has_many :users, through: :clothe_transactions
  has_many :clothes, through: :clothe_transactions

  validates :name, presence: true # déterminée par l'équipe komod'
  validates :type, presence: true # (future toggle list)
end
