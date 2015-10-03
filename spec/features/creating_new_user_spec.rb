require 'rails_helper'

feature "Creating a new user" do
  background do
    visit root_path
    click_link "REGISTER"
  end
  
  scenario "Can create a new account with the index" do
    fill_in "  User Name", with: "example"
    fill_in "  Email", with: "user@example.com"
    fill_in "  Password", with: "helloworld", match: :first
    fill_in "  Confirm Password", with: "helloworld"

    click_button "Sign Up"
    expect(page).to have_content("A message with a confirmation link")
  end

  scenario "Requires a username to sign up" do
    fill_in "  Email", with: "user@example.com"
    fill_in "  Password", with: "helloworld", match: :first
    fill_in "  Confirm Password", with: "helloworld"

    click_button "Sign Up"
    expect(page).to have_content("can't be blank")
  end

  scenario "Requires a username to have more than 4 characters" do
    fill_in "  User Name", with: "a"
    fill_in "  Email", with: "user@example.com"
    fill_in "  Password", with: "helloworld", match: :first
    fill_in "  Confirm Password", with: "helloworld"

    click_button "Sign Up"
    expect(page).to have_content("minimum is 4 characters")
  end

  scenario "A User Name can't be longer than 16 characters" do
    fill_in "  User Name", with: "a" * 17
    fill_in "  Email", with: "user@example.com"
    fill_in "  Password", with: "helloworld", match: :first
    fill_in "  Confirm Password", with: "helloworld"

    click_button "Sign Up"
    expect(page).to have_content("maximum is 16 characters")
  end
end