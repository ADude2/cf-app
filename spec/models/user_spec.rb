require 'rails_helper'

RSpec.describe User, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:user_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:role).of_type(:string) }
    it { is_expected.to have_db_column(:slug).of_type(:string) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_uniqueness_of(:user_name) }
  end
end