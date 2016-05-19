class TweetsController < ApplicationController
  def show
    tweet = tclient.status(params[:tweet_id])
    render json: tweet
  end

  private
    def tweet_params

    end
end