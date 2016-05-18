class MediaFile < ApplicationRecord
  belongs_to :tweet, foreign_key: "tweet_id"

  validates_presence_of :tweet_id, :link, :media_type
  validates_uniqueness_of :link
  validates :media_type, inclusion: { in: %w(photo gif video)}
end
