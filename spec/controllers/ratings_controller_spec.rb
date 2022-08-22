require 'rails_helper'

RSpec.describe RatingsController, type: :controller do

  let!(:user) { FactoryBot.create(:user, :with_post) }

  describe 'POST /posts' do
    it 'should rate post' do
      post :create, params: {'rating':{'user_id': user.id,'post_id': user.posts.ids.first,'value':3}}
      rating = Rating.where(value: 3)
      expect(rating).to exist
      expect(response).to have_http_status(:created)
    end

    it 'should NOT rate post' do
      post :create, params: {'rating':{'post_id': user.posts.ids.first,'value':3}}
      rating = Rating.where(value: 3)
      expect(rating).not_to exist
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end