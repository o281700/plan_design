class Item < ApplicationRecord
  belongs_to :plan
  has_many :details, dependent: :destroy

  validates :title, presence: true
end
