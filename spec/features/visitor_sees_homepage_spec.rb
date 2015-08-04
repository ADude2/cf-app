require 'rails_helper'

feature "Visitor sees the homepage" do
  scenario "with index text" do
    visit root_path
    expect(page).to have_content "index"
  end  
end