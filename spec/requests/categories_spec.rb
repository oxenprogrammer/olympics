require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/categories/show"
      expect(response).to have_http_status(:success)
    end
  end

end
