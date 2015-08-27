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
end