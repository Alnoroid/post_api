class PostsController < ApplicationController
  # rescue_from NoMethodError, :with => :method_not_found

  def create
    post = Post.new(post_params)
    if post.save
      render json: post.to_json(:include => :user), status: 201
    else
      render json: { errors: post.errors }, status: 422
    end
  end

  def top

  end

  private

  def post_params
    params.require(:post).permit(:title, :body, user_attributes: [:login, :ip])
  end
end
