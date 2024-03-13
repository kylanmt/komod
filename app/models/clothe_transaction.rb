class ClotheTransaction < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :clothe
  belongs_to :event, optional: true
  belongs_to :chatroom

  validates :start_date, presence: true
end
