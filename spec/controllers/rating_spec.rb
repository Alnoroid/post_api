require 'rails_helper'

RSpec.describe Rating, type: :controller do
  let!(:high_rating) { FactoryBot.create(:rating, 2) }
  describe 'POST /ratings' do
    it 'returns http success' do
      # get '/rating/create'
      # expect(response).to have_http_status(:success)
    end
  end
end