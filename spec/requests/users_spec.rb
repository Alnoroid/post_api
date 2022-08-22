require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:posts) { FactoryBot.create_list(:user,3,:with_post)}

  describe 'GET /users/ips' do
    it 'returns http success' do
      get '/users/ips'
      expect(response).to have_http_status(:success)
    end

    it 'returns author and ip of user' do
      get '/users/ips'
      json_body = JSON.parse(response.body)
      expect(json_body[0]).to have_key('ip')
    end

    it 'returns array of authors' do
      get '/users/ips'
      json_body = JSON.parse(response.body)
      expect(json_body[0]['authors']).to be_kind_of(Array)
    end
  end
end
