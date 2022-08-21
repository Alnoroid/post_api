class User < ApplicationRecord
  has_many :posts

  validates :login, presence: true, uniqueness: true
  validates :ip, presence: true

  def self.list_authors_by_ips
    users = User.select("ip, array_agg(login) as authors").group(:ip)
    users.as_json.map {|u| u.except!('id')}
  end

end
