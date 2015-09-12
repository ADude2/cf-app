require 'rails_helper'

RSpec.describe Gym, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:website).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:state).of_type(:string) }
    it { is_expected.to have_db_column(:zip).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:lat).of_type(:float) }
    it { is_expected.to have_db_column(:long).of_type(:float) }
    it { is_expected.to have_db_column(:unique_id).of_type(:integer) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:unique_id) }
    it { is_expected.to validate_uniqueness_of(:unique_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:lat) }
    it { is_expected.to validate_presence_of(:long) }
  end

  describe "Gym" do
    before do
      @gym = FactoryGirl.create(:gym)
    end
    
    it "is valid with a unique_id, name, latitutde and longitude" do
      expect(@gym).to be_valid
    end

    it "is invalid without a unique_id" do
      gym = FactoryGirl.build(:gym, unique_id: nil)
      gym.valid?
      expect(gym.errors[:unique_id]).to include("can't be blank")
    end

    it "is invalid without a name" do
      gym = FactoryGirl.build(:gym, name: nil)
      gym.valid?
      expect(gym.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a latitude" do
      gym = FactoryGirl.build(:gym, lat: nil)
      gym.valid?
      expect(gym.errors[:lat]).to include("can't be blank")
    end

    it "is invalid without a longitude" do
      gym = FactoryGirl.build(:gym, long: nil)
      gym.valid?
      expect(gym.errors[:long]).to include("can't be blank")
    end

    it "returns an average of the overall score based on the amount of reviews" do      
      user = FactoryGirl.create(:user)
      review = FactoryGirl.create(:review, user: user, gym: @gym)
      review_two = FactoryGirl.create(:review, score: 1.0, user: user, gym: @gym)
      expect(@gym.average_rating).to eq(2.5)
    end
  end
end