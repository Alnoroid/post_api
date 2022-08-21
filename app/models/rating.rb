class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post_id,:user_id,:value, presence: true
  validates :value, numericality: { in: 1..5 }
end
