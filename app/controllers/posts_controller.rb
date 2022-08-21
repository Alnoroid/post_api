class PostsController < ApplicationController
  def create
    # user = User.create_or_find_by(login: params[:login])
    user.new
    Post.create(user: user, title: params[:title], body: params[:body], ip: params[:ip])
    render json: { text: 'hello world' }
  end

  def rate
  end

  def top
  end

  def list_ips
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :ip)
  end

  def user_params
    params.require(:user).permit(:login)
  end
end
