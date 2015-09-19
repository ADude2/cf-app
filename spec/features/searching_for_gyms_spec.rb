require 'rails_helper'

feature "search function" do
  background do
    @gym = FactoryGirl.create(:gym)
    @gym2 = FactoryGirl.create(:gym, name: "Crossfit Persist",
                                      website: "http://www.crossfitpersist.com/",
                                      address: "165 Amboy Ave, #705",
                                      city: "Morganville",
                                      state: "NJ",
                                      zip: "07551",
                                      country: "United States",
                                      lat: 34.0424,
                                      long: -118.4414,
                                      unique_id: 1)
    visit root_path
  end

  scenario "not entering a search term shows all gyms" do
    click_button "Search"

    expect(page).to have_content "#{@gym.name}"
    expect(page).to have_content "#{@gym2.name}"
  end

  scenario "searching for a gym returns the result only" do
    fill_in :search, with: "Ballston"
    click_button "Search"

    expect(page).to have_content "#{@gym.name}"
    expect(page).to_not have_content "#{@gym2.name}"
  end
end