require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:posts) { FactoryBot.create(:user, :with_post) }
  let(:low_rating) { FactoryBot.create(:low_rating) }
  let(:high_rating) { FactoryBot.create(:high_rating) }

  describe 'GET /posts/top/' do
    it 'returns http success' do
      get '/posts/top/1'
      expect(response).to have_http_status(:success)
    end
  end
end
