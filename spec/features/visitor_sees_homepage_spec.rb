require 'rails_helper'

feature "User visits the homepage" do
  scenario "with Title text" do
    visit root_path

    expect(page).to have_content "New to CrossFit?"
  end

  scenario "User can see the About page link" do
    visit root_path

    expect(page).to have_selector(:link_or_button, "ABOUT")
  end

  scenario "User can see the Contact Us link" do
    visit root_path

    expect(page).to have_selector(:link_or_button, "CONTACT")
  end

  scenario "User can see the Register link" do
    visit root_path

    expect(page).to have_selector(:link_or_button, "REGISTER")
  end

  scenario "User can see the Log In link" do
    visit root_path

    expect(page).to have_selector(:link_or_button, "LOGIN")
  end
end