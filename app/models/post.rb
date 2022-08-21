class Post < ApplicationRecord
  belongs_to :user, autosave: true
  accepts_nested_attributes_for :user

  validates :user_id,:title,:body, presence: true

  before_validation :find_user

  def find_user
    self.user = User.find_or_create_by(login: user.login) do |u|
      u.ip = user.ip
    end
  end
end
