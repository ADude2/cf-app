require 'rails_helper'

feature "User authentication" do 
  background do
    user = FactoryGirl.create(:user)
  end

  scenario "Can login from the index page" do
    visit root_path
    expect(page).to_not have_content("Sign Out")

    click_link "Login"
    fill_in "Email", with: "lolleroni@example.com"
    fill_in "Password", with: "helloworld"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to_not have_content("Register")
    expect(page).to have_content("Sign Out")
  end

  scenario "Can logout once logged in" do
    visit root_path
    
    click_link "Login"
    fill_in "Email", with: "lolleroni@example.com"
    fill_in "Password", with: "helloworld"
    click_button "Log in"
    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully.")
  end
end