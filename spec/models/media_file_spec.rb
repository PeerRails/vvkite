require 'rails_helper'

RSpec.describe MediaFile, :type => :model do

  let(:user_factory) { create(:user) }
  let(:tweet_factory) { create(:tweet, user: user_factory) }
  let(:media_file_factory) { create(:media_file, tweet: tweet_factory) }

  it "has a valid factory" do
    expect(build(:media_file, tweet: tweet_factory)).to be_valid
  end

  describe "associations" do
    it { expect(media_file_factory).to belong_to(:tweet) }
  end

  describe "validations" do
    it { expect(media_file_factory).to validate_presence_of(:tweet_id) }
    it { expect(media_file_factory).to validate_presence_of(:link) }
    it { expect(media_file_factory).to validate_presence_of(:media_type) }
    it { expect(media_file_factory).to validate_uniqueness_of(:link) }
    it { expect(media_file_factory).to validate_inclusion_of(:media_type).in_array(['photo', 'gif', 'video']) }
  end
end
