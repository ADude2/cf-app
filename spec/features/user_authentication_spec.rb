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

  scenario "Can edit profile once logged in" do
    visit root_path
    
    click_link "Login"
    fill_in "Email", with: "lolleroni@example.com"
    fill_in "Password", with: "helloworld"
    click_button "Log in"

    visit edit_user_registration_path
    expect(page).to have_content("Edit User")

    fill_in "Email", with: "lolleroni@example.com"
    fill_in "Enter Current Password to Save Changes", with: "helloworld"
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "Can delete profile once logged in" do
    visit root_path
    
    click_link "Login"
    fill_in "Email", with: "lolleroni@example.com"
    fill_in "Password", with: "helloworld"
    click_button "Log in"

    visit edit_user_registration_path
    click_button "Cancel my account"

    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")

  end

  scenario "Must be logged in to update profile" do
    visit edit_user_registration_path
    
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end