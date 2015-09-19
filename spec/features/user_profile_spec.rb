require 'rails_helper'

  feature "User Profile" do
    background do
      @gym = FactoryGirl.create(:gym)
      @user = FactoryGirl.create(:user)
      @user_two = FactoryGirl.create(:user, email: "hi@hello.com", 
                                            user_name: "Sergio", 
                                            password: "helloworld", 
                                            id: 2)
      @review = FactoryGirl.create(:review, user: @user, gym: @gym)
      @review2 = FactoryGirl.create(:review, content: "another review!", user: @user_two, gym: @gym)
      sign_in_with @user
      visit user_path(@user)
    end

    scenario "only has a user's review" do
      expect(page).to have_content("#{@user.user_name}")
      expect(page).to have_content("#{@review.content}")

      expect(page).to_not have_content("#{@user_two.user_name}")
      expect(page).to_not have_content("#{@review2.content}")
    end

    scenario "can edit a review from the profile" do
      expect(page).to have_link("Edit")

      click_link "Edit"
      expect(page).to have_content("Edit Your Review")
    end

    scenario "can delete a review from the profile" do
      expect(page).to have_link("Delete")
    end
  end