class PostsController < ApplicationController
  # rescue_from NoMethodError, :with => :method_not_found

  def create
    post = Post.new(post_params)
    if post.save
      render json: post.to_json(include: :user), status: :created
    else
      render json: { errors: post.errors }, status: :unprocessable_entity
    end
  end

  def top
    posts = Post.top_n(params[:posts_count])
    render json: posts, status: :ok

    # SELECT posts.id, posts.title, posts.body,AVG(r.value) as rating  FROM posts
    # INNER JOIN ratings r on posts.id = r.post_id
    # GROUP BY posts.id
    # ORDER BY rating DESC
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, user_attributes: %i[login ip])
  end
end
