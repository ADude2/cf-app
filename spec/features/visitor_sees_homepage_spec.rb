require 'rails_helper'

feature "User visits the homepage" do
  scenario "with Title text" do
    visit root_path

    expect(page).to have_content "Reviews"
  end

  scenario "User can see the About page link" do
    visit root_path

    expect(page).to have_selector(:link_or_button, "About CFBR")
  end

  scenario "User can see the Contact Us link" do
    visit root_path

    expect(page).to have_selector(:link_or_button, "Contact Us")
  end

  scenario "User can see the Register link" do
    visit root_path

    expect(page).to have_selector(:link_or_button, "Register")
  end

  scenario "User can see the Log In link" do
    visit root_path

    expect(page).to have_selector(:link_or_button, "Log In")
  end
end