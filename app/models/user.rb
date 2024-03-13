class User < ApplicationRecord
  has_many :chatrooms, through: :messages
  has_many :likes, dependent: :destroy
  has_many :clothes, foreign_key: :owner_id, dependent: :destroy
  has_many :clothe_transactions, foreign_key: :client_id, dependent: :destroy
  has_one_attached :photo

  validates :user_name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }, allow_blank: true
  validates :address, presence: true, length: { maximum: 255 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
