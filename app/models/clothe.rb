class Clothe < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :category

  has_many :clothe_transactions
  has_many :chatrooms, through: :clothe_transaction

  has_many :likes, dependent: :destroy
  has_many_attached :photos
  # has_many :likers, through: :likes, source: :user

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  # validates :size, presence: true (future toggle list)
  validates :value, presence: true # (future toggle list)
  validates :condition, presence: true # (future toggle list)

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [ :name, :description, :brand ],

    associated_against: {
      category: [:name]
    },

    using: {
      tsearch: { prefix: true }
    }
end
