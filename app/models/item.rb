class Item < ApplicationRecord
  belongs_to :plan

  validates :title, presence: true
end
