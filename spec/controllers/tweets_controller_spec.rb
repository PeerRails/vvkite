require 'rails_helper'


RSpec.describe TweetsController, type: :controller do
  let(:tweet_id) { 733743309923946497 }
  let(:json_file) { File.new(File.expand_path('../../fixtures/status.json', __FILE__)) }

  describe "GET #show" do

    before do
      request.env["HTTP_ACCEPT"] = 'application/json'
      ENV["TWITTER_CONSUMER_KEY"] = "TCK"
      ENV["TWITTER_CONSUMER_SECRET"] = "TCS"
      ENV["TWITTER_ACCESS_TOKEN"] = "TAK"
      ENV["TWITTER_ACCESS_SECRET"] = "TAS"
      stub_request(:get, "https://api.twitter.com/1.1/statuses/show/#{tweet_id}.json")
        .with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'TwitterRubyGem/5.16.0'})
        .to_return(:status => 200, :body => json_file, :headers => {"Content-Type"=> "application/json"})
      get :show,  params: { tweet_id: tweet_id }
    end

    subject(:tweet) { JSON.parse(response.body) }

    describe "responses" do
      it { expect(tweet["error"]).to be nil}
      it { expect(tweet["tweet_id"]).to eq(tweet_id)}
      #it { is_expected.to change{ Tweet.count }.by(1) }
    end
  end
end
