require 'rails_helper'

RSpec.describe Tweet, type: :model do

  let(:user_factory) { create(:user) }
  let(:tweet_factory) { create(:tweet, user: user_factory) }
  let(:media_file_factory) { create(:media_file, tweet: tweet_factory) }
  let(:tweet) { Twitter::Tweet.new(id: 1,
    text: 'foo',
    user: {id: 1, screen_name: 'sferik'},
    entities: {
      media: [
        {id: 1,
          type: %w(photo animated_gif video).sample,
          media_url_https: Faker::Placeholdit.image
        }
      ]
    })
  }
  let(:tweet_custom_photo) { Twitter::Tweet.new(id: 1,
    text: 'foo',
    user: {id: 1, screen_name: 'sferik'},
    entities: {
      media: [
        {id: 1,
          type: "photo",
          media_url_https: Faker::Placeholdit.image
        }
      ]
    })
  }

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

  describe "custom methods" do
    it { expect{Tweet.add_status tweet_custom_photo}.to change{ Tweet.count }.by(1) }
    it { expect{Tweet.add_status tweet_custom_photo}.to change{ User.count }.by(1) }
    it { expect{Tweet.add_status tweet_custom_photo}.to change{ MediaFile.count }.by(1) }
  end
end