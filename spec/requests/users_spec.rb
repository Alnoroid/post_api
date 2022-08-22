require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/ips' do
    it 'return' do
      get '/users/ips'
      expect(response).to have_http_status(:success)
    end
  end
end
