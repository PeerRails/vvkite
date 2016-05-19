require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  let(:user_factory) { create(:user) }
  let(:tweet_factory) { create(:tweet, user: user_factory) }
  let(:media_file_factory) { create(:media_file, tweet: tweet_factory) }

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

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
