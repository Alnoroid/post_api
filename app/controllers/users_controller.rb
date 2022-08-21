class UsersController < ApplicationController
  def ips
    render json: User.list_authors_by_ips, status: 200
  end
end