class UsersController < ApplicationController
  def ips
    users = User.select("ip, array_agg(login) as authors").group(:ip)
    users = users.as_json.map {|u| u.except!('id')}
    render json: users, status: 200
  end
end