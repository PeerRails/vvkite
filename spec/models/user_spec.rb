require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end
  it "has a valid factory" do
    expect(Fabricate(:user)).to be_valid
  end
end
