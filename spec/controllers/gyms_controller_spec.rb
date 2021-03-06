require 'rails_helper'

RSpec.describe GymsController, type: :controller do

  describe "GET index page" do
    it "returns http redirect" do
      get :index
      expect(response).to have_http_status(302)
    end
  end

  describe "GET show page" do
    before do
      @gym = FactoryGirl.create(:gym)
    end

    it "returs http success" do
      get :show, id: @gym
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, id: @gym
      expect(response).to render_template :show
    end
  end
end
