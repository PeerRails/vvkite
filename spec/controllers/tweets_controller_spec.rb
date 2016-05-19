require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe "GET #show" do
    before do
      request.env["HTTP_ACCEPT"] = 'application/json'
      ENV["TWITTER_CONSUMER_KEY"] = "TCK"
      ENV["TWITTER_CONSUMER_SECRET"] = "TCS"
      ENV["TWITTER_ACCESS_TOKEN"] = "TAK"
      ENV["TWITTER_ACCESS_SECRET"] = "TAS"
    end

    let(:tweet_id) { Faker::Number.number(10) }

    it "should show tweets media files" do
      stub_request(:get, "https://api.twitter.com/1.1/statuses/show/#{tweet_id}.json")
        .with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'TwitterRubyGem/5.16.0'})
        .to_return(:status => 200, :body => %{{
  "created_at": "Wed Jun 06 20:07:10 +0000 2012",
  "id_str": "#{tweet_id}",
  "text": "Along with our new #Twitterbird, we've also updated our Display Guidelines: https://t.co/Ed4omjYs  ^JC",
  "id": #{tweet_id},
  "entities": {
    "hashtags": [],
    "symbols": [],
    "urls": [],
    "user_mentions": [],
    "media": [{
      "id": 266031293949698048,
      "id_str": "266031293949698048",
      "indices": [17, 37],
      "media_url": "http:\/\/pbs.twimg.com\/media\/A7EiDWcCYAAZT1D.jpg",
      "media_url_https": "https:\/\/pbs.twimg.com\/media\/A7EiDWcCYAAZT1D.jpg",
      "url": "http:\/\/t.co\/bAJE6Vom",
      "display_url": "pic.twitter.com\/bAJE6Vom",
      "expanded_url": "http:\/\/twitter.com\/BarackObama\/status\/266031293945503744\/photo\/1",
      "type": "photo",
      "sizes": {
        "medium": {
          "w": 600,
          "h": 399,
          "resize": "fit"
        },
        "thumb": {
          "w": 150,
          "h": 150,
          "resize": "crop"
        },
        "small": {
          "w": 340,
          "h": 226,
          "resize": "fit"
        },
        "large": {
          "w": 800,
          "h": 532,
          "resize": "fit"
        }
      }
    }]
  }
}}, :headers => {"Content-Type"=> "application/json"})
      get :show,  params: { tweet_id: tweet_id }
      json = JSON.parse(response.body)
      expect(json["error"]).to be nil
    end
  end
end
