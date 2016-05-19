require 'rails_helper'

RSpec.describe Tweet, type: :model do

  let(:user_factory) { create(:user) }
  let(:tweet_factory) { create(:tweet, user: user_factory) }
  let(:media_file_factory) { create(:media_file, tweet: tweet_factory) }

  it "has a valid factory" do
    expect(build(:tweet, user: user_factory)).to be_valid
  end

  describe "associations" do
    it { expect(tweet_factory).to belong_to(:user) }
    it { expect(tweet_factory).to have_many(:media_files) }
  end

  describe "validations" do
    it { expect(tweet_factory).to validate_presence_of(:tweet_id) }
    it { expect(tweet_factory).to validate_presence_of(:twitter_id) }
    it { expect(tweet_factory).to validate_presence_of(:user_id) }
    it { expect(tweet_factory).to validate_presence_of(:link) }
    it { expect(tweet_factory).to validate_presence_of(:media_type) }
    it { expect(tweet_factory).to validate_inclusion_of(:media_type).in_array(['photo', 'gif', 'video']) }
    it { expect(tweet_factory).to validate_uniqueness_of(:link) }
    it { expect(tweet_factory).to validate_uniqueness_of(:tweet_id) }
  end
end