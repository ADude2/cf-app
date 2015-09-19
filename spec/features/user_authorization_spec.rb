require 'rails_helper'

  feature "user authorization" do
    background do
      @gym = FactoryGirl.create(:gym)
      @user = FactoryGirl.create(:user)
      @user_two = FactoryGirl.create(:user, email: "hi@hello.com", 
                                            user_name: "Sergio", 
                                            password: "helloworld", 
                                            id: 2)
      @review = FactoryGirl.create(:review, user: @user, gym: @gym)
      sign_in_with @user
      visit "/gyms/ballston-crossfit/"
    end

    scenario "must be logged in to create a review" do
      click_link "Sign Out"
      visit "/gyms/ballston-crossfit/"
      expect(page).to have_selector(:link_or_button, "Add a review")

      click_link "Add a review"
      expect(page).to have_content("You must sign up or login first.")
    end

    scenario "can add a review once logged in" do
      expect(page).to have_selector(:link_or_button, "Add a review")

      click_link "Add a review"
      expect(page).to have_content("Your Review of")
    end

    scenario "can edit your own review" do
      expect(page).to have_content("Edit")
    end

    scenario "can delete your own review" do
      expect(page).to have_content("Delete")
    end

    scenario "no one else can edit or delete a user's post" do
      click_link "Sign Out"
      sign_in_with @user_two
      visit "/gyms/ballston-crossfit/"

      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")
    end
  end