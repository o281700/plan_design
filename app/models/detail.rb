class Detail < ApplicationRecord
  belongs_to :item

  validates :title, :text, presence: true
end
