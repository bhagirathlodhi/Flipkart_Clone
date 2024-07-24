require 'rails_helper'

RSpec.describe "Seraches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/serach/index"
      expect(response).to have_http_status(:success)
    end
  end

end
