class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :login, presence: true

  def self.list_authors_by_ips
    users = User.select('ip, array_agg(login) as authors').joins(:posts).group(:ip)
    users.as_json.map { |u| u.except!('id') }
  end
end
