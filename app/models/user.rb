class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :login, presence: true

  def self.list_authors_by_ips
    # SELECT ip, array_agg(login) as authors FROM "users"
    # INNER JOIN posts p on users.id = p.user_id
    # GROUP BY "ip"

    users = User.select('ip, array_agg(login) as authors').joins(:posts).group(:ip)
    users.as_json.map { |u| u.except!('id') }
  end
end
