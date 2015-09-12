require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:gym_id).of_type(:integer) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
    it { is_expected.to have_db_column(:score).of_type(:float) }
    it { is_expected.to have_db_column(:pricing).of_type(:float) }
    it { is_expected.to have_db_column(:coaching).of_type(:float) }
    it { is_expected.to have_db_column(:equipment).of_type(:float) }
    it { is_expected.to have_db_column(:location).of_type(:float) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:gym_id) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:coaching) }
    it { is_expected.to validate_presence_of(:pricing) }
    it { is_expected.to validate_presence_of(:equipment) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content) }
  end

  describe "Review" do
    before do
      @gym = FactoryGirl.create(:gym)
      @user = FactoryGirl.create(:user)
      @review = FactoryGirl.create(:review, user: @user, gym: @gym)
    end

    it "is valid with content, coaching, equipment, pricing, location and score" do
      expect(@review).to be_valid
    end

    it "is invalid without content" do
      review = FactoryGirl.build(:review, user: @user, gym: @gym, content: nil)
      review.valid?
      expect(review.errors[:content]).to include("can't be blank", "is too short (minimum is 5 characters)")
    end

    it "is invalid without coaching" do
      review = FactoryGirl.build(:review, user: @user, gym: @gym, coaching: nil)
      review.valid?
      expect(review.errors[:coaching]).to include("can't be blank")
    end

    it "is invalid without pricing" do
      review = FactoryGirl.build(:review, user: @user, gym: @gym, pricing: nil)
      review.valid?
      expect(review.errors[:pricing]).to include("can't be blank")
    end

    it "is invalid without equipment" do
      review = FactoryGirl.build(:review, user: @user, gym: @gym, equipment: nil)
      review.valid?
      expect(review.errors[:equipment]).to include("can't be blank")
    end

    it "is invalid without location" do
      review = FactoryGirl.build(:review, user: @user, gym: @gym, location: nil)
      review.valid?
      expect(review.errors[:location]).to include("can't be blank")
    end

    it "is invalid without score" do
      review = FactoryGirl.build(:review, user: @user, gym: @gym, score: nil)
      review.valid?
      expect(review.errors[:score]).to include("can't be blank")
    end
  end
end