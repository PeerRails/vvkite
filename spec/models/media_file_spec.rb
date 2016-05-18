require 'rails_helper'

RSpec.describe MediaFile, :type => :model do
  before do
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end
  it "has a valid factory" do
    expect(Fabricate(:media_file)).to be_valid
  end

  let(:media_file_factory) { Fabricate(:media_file) }

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
