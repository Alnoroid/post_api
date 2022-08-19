require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/posts/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /rate" do
    it "returns http success" do
      get "/posts/rate"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /top" do
    it "returns http success" do
      get "/posts/top"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /get_by_ip" do
    it "returns http success" do
      get "/posts/get_by_ip"
      expect(response).to have_http_status(:success)
    end
  end

end
