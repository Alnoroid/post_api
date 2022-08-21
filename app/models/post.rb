class Post < ApplicationRecord
  belongs_to :user, autosave: true
  has_many :ratings

  accepts_nested_attributes_for :user

  validates :user_id,:title,:body, presence: true

  before_validation :find_user

  def find_user
    self.user = User.find_or_create_by(login: user.login) do |u|
      u.ip = user.ip
    end
  end

  def self.top_n(posts_count)
    # Post.ratings.average(:value).order('rating DESC').limit(posts_count)
    select('posts.id, posts.title, posts.body, AVG(ratings.value) as rating').joins(:ratings).group(:id).order('rating DESC').limit(posts_count)
    # select('posts.id, posts.title, posts.body').joins(:ratings).group(:id).order('rating DESC')
    # SELECT posts.id, posts.title, posts.body,AVG(r.value) as rating  FROM posts
    # INNER JOIN ratings r on posts.id = r.post_id
    # GROUP BY posts.id
    # ORDER BY rating DESC
  end
end
