class TweetsController < ApplicationController
  def show
    #tclient.status(params[:tweet_id])
    tweet = Tweet.find_by(tweet_id: tweet_id_params)
    render json: tweet
  end

  def upload
    status = tclient.status(tweet_params[:link].match(/status\/(?<id>\d+)/)[:id])
    tweet = Tweet.find_by_tweet_id(status.id)
    if tweet.nil?
      tweet = Tweet.add_status status
    end
    render json: tweet
  end

  private
    def tweet_id_params
      params.require(:tweet_id)
    end

    def user_params
      params.require(:user)
    end

    def tweet_params
      params.require(:tweet).permit(:link)
    end
end