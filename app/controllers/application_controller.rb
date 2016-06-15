class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Twitter::Error::NotFound, with: :twitter_error_not_found

  private
    def tclient
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
      end
    end

    def twitter_error_not_found
      render json: {error: true, message: "Not Found"}, status: 404
    end

end
