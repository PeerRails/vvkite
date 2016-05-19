class TweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet_id, :twitter_id, :link, :text
  has_many :media_files do
    object.media_files
  end
end
