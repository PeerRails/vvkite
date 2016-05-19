class Tweet < ApplicationRecord
  belongs_to :user
  has_many :media_files

  validates_presence_of :tweet_id, :twitter_id, :link, :media_type, :user_id
  validates_uniqueness_of :link, :tweet_id
  validates :media_type, inclusion: { in: %w(photo gif video)}
end
