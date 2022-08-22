require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:posts) { FactoryBot.create(:user, :with_post) }
  let!(:low_rating) { FactoryBot.create(:rating, :low_value) }
  let!(:high_rating) { FactoryBot.create(:rating, :high_value) }
  params = {
    "post":
      {"title":"testpost","body":"LoremIpsum",
       "user_attributes":
         {"login":"tester","ip":"127.0.0.1"}}}

  describe 'GET /posts/top/' do
    it 'returns http success' do
      get '/posts/top/1'
      expect(response).to have_http_status(:success)
    end

    it 'returns max rating' do
      get '/posts/top/1'
      json_body = JSON.parse(response.body)
      expect(json_body[0]["rating"]).to eq("5.0")
    end
  end

  describe 'POST /posts' do
    it 'should create post' do
      # post :posts, params
      # expect{ Post.count }
      #   .to change(Post, :count).by(+1)
    end

    it 'should create user' do
      # post '/posts', params

    end
  end
end
