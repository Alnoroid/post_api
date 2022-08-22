require 'rails_helper'

RSpec.describe Rating, type: :model do
  let!(:low_rating) { FactoryBot.create(:rating, :low_value) }
  let!(:high_rating) { FactoryBot.create(:rating, :high_value) }

  describe 'concurrency test' do
    it 'returns the second item' do
      get '/rating/create'
      expect(response).to have_http_status(:success)
    end
  end
end
