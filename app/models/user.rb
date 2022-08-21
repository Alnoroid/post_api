class User < ApplicationRecord
  has_many :posts

  validates :login, presence: true, uniqueness: true
  validates :ip, presence: true

end
