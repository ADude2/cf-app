require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index page" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET about page" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET contact us page" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end
end
