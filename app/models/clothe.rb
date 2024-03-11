class Clothe < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :transactions
  has_many :likes, dependent: :destroy
  has_many_attached :photos
  # has_many :likers, through: :likes, source: :user

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  # validates :size, presence: true (future toggle list)
  validates :value, presence: true #(future toggle list)
  validates :category, presence: true # (future toggle list)
  validates :condition, presence: true # (future toggle list)
end
