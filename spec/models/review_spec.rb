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
    it { is_expected.to validate_length_of(:content) }
  end
end