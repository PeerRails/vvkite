require 'rails_helper'


RSpec.describe TweetsController, type: :controller do
  let(:tweet_id) { 733743309923946497 }
  let(:json_file) { File.new(File.expand_path('../../fixtures/status.json', __FILE__)) }
  let(:tweet_404) { File.new(File.expand_path('../../fixtures/404_tweet.json', __FILE__)) }

  before do
    @user_factory = create(:user)
    @tweet_factory = create(:tweet, tweet_id: tweet_id, user: @user_factory)
    @mf_factory = create(:media_file, tweet: @tweet_factory)
  end

  describe "GET #show" do

    before do
      get :show,  params: { tweet_id: tweet_id, user: @user_factory.screen_name }
    end

    subject(:tweet) { JSON.parse(response.body) }

    describe "responses" do
      it { expect(tweet["error"]).to be nil}
      it { expect(tweet["tweet_id"]).to eq(tweet_id)}
    end
  end

  describe "GET #get" do

    before do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    subject(:tweet) { JSON.parse(response.body)}

    describe "responses" do

      before do
        request.env["HTTP_ACCEPT"] = 'application/json'
        @tweet_factory.destroy
        stub_request(:get, "https://api.twitter.com/1.1/statuses/show/#{tweet_id}.json")
          .with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'TwitterRubyGem/5.16.0'})
          .to_return(:status => 200, :body => json_file, :headers => {"Content-Type"=> "application/json"})
        get :get,  params: { link: "http://twitter.com/#{@user_factory.screen_name}/status/#{tweet_id}" }
      end

      it { expect(tweet["error"]).to be nil}
      it { expect(tweet["tweet_id"]).to eq(tweet_id)}
    end

    describe "false responses" do
      before do
        stub_request(:get, "https://api.twitter.com/1.1/statuses/show/0.json")
          .with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'TwitterRubyGem/5.16.0'})
          .to_return(:status => 404, :body => tweet_404, :headers => {"Content-Type"=> "application/json"})
        get :get,  params: { link: "https://google.com" }
      end
      it { expect(tweet["error"]).to be true}
      it { expect(tweet["message"]).to eq("Not Found")}
    end

  end
end
