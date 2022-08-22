require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'POST /posts' do
    it 'should create post and user' do
      post :create,
           params: { post: { title: 'testpost', body: 'LoremIpsum', ip: '127.0.0.1',
                             user_attributes: { login: 'tester' } } }
      post = Post.where(ip: '127.0.0.1')
      user = User.where(login: 'tester')
      expect(post).to exist
      expect(user).to exist
      expect(response).to have_http_status(:created)
    end

    it 'should NOT create post and user' do
      post :create, params: { post: { title: 'testpost', body: 'LoremIpsum', user_attributes: { login: 'tester' } } }
      post = Post.where(ip: '127.0.0.1')
      user = User.where(login: 'tester')
      expect(post).not_to exist
      expect(user).not_to exist
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
