require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  it "creates a succesful post" do

      post :create, message: {
        name: "Member",
        email: "member@example.com",
        subject: "hi",
        content: "bai"
      }
    assert_redirected_to new_message_path
  end
end