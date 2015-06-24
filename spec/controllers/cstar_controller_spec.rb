require 'rails_helper'

RSpec.describe CstarController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #submit2names" do
    it "returns http success" do
      get :submit2names
      expect(response).to have_http_status(:success)
    end
  end

end
