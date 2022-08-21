class Post < ApplicationRecord
  belongs_to :user

  validates :user_id,:title,:body,:ip, presence: true
end
