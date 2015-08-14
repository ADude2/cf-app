require 'rails_helper'

RSpec.describe GymsController, type: :controller do

  describe "GET index page" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
