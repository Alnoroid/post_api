require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /ips" do
    it "returns http success" do
      get "/users/ips"
      expect(response).to have_http_status(:success)
    end
  end

end
