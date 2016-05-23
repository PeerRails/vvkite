require 'rails_helper'


RSpec.describe TweetsController, type: :controller do
  let(:tweet_id) { 733743309923946497 }
  let(:json_file) { File.new(File.expand_path('../../fixtures/status.json', __FILE__)) }

  before do
    @user_factory = create(:user)
    @tweet_factory = create(:tweet, tweet_id: tweet_id, user: @user_factory)
    @mf_factory = create(:media_file, tweet: @tweet_factory)
  end

  describe "GET #show" do

    before do
      request.env["HTTP_ACCEPT"] = 'application/json'
      stub_request(:get, "https://api.twitter.com/1.1/statuses/show/#{tweet_id}.json")
        .with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'TwitterRubyGem/5.16.0'})
        .to_return(:status => 200, :body => json_file, :headers => {"Content-Type"=> "application/json"})
      get :show,  params: { tweet_id: tweet_id, user: @user_factory.screen_name }
    end

    subject(:tweet) { JSON.parse(response.body) }

    describe "responses" do
      it { expect(tweet["error"]).to be nil}
      it { expect(tweet["tweet_id"]).to eq(tweet_id)}
    end
  end


  describe "POST #upload" do

    before do
      request.env["HTTP_ACCEPT"] = 'application/json'
      @tweet_factory.destroy
      stub_request(:get, "https://api.twitter.com/1.1/statuses/show/#{tweet_id}.json")
        .with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'TwitterRubyGem/5.16.0'})
        .to_return(:status => 200, :body => json_file, :headers => {"Content-Type"=> "application/json"})
      post :upload,  params: { tweet: {link: "http://twitter.com/#{@user_factory.screen_name}/status/#{tweet_id}"} }
    end

    subject(:tweet) { JSON.parse(response.body) }

    describe "responses" do
      it { expect(tweet["error"]).to be nil}
      it { expect(tweet["tweet_id"]).to eq(tweet_id)}
      #it { is_expected.to change{ Tweet.count }.by(1) }
    end
  end
end
