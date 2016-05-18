require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end
  it "has a valid factory" do
    expect(Fabricate(:user)).to be_valid
  end

  let(:user_factory) { Fabricate(:user) }

  describe "associations" do
    it { expect(user_factory).to have_many(:tweets) }
  end

  describe "validations" do
    it { expect(user_factory).to validate_presence_of(:twitter_id) }
    it { expect(user_factory).to validate_presence_of(:screen_name) }
    it { expect(user_factory).to validate_uniqueness_of(:twitter_id).case_insensitive }
    it { expect(user_factory).to validate_uniqueness_of(:screen_name) }
  end
end
