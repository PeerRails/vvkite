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

  def get
    #link = url_params[:link][/(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix] || nil
    #status = link.match(/status\/(?<id>\d+)/)
    status = tclient.status(url_params[:link])
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

    def url_params
      params.permit(:link)
    end
end