class TweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet_id, :twitter_id, :link, :text
  has_many :media_files
end
