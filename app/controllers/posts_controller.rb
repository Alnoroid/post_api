class PostsController < ApplicationController
  def create
    user = User.create_or_find_by(login: params[:login])
    Post.create(user: user, title: params[:title], body: params[:body], ip: params[:ip])
    render json: { text: 'hello world' }
  end

  def rate
  end

  def top
  end

  def get_by_ip
  end

  
end
