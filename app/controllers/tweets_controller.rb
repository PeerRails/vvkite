class TweetsController < ApplicationController
  def show
    #tclient.status(params[:tweet_id])
    tweet_id = params[:tweet_id]
    tweet = Tweet.find_by_tweet_id(tweet_id)
    if tweet.nil?
      tweet = Tweet.add_status tclient.status( tweet_id )
    end
    render json: tweet
  end

  private
    def tweet_params

    end
end