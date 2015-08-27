require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:gym_id).of_type(:integer) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content) }
  end
end