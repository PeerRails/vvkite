class User < ApplicationRecord
  has_many :tweets
  has_many :media_files, through: :tweets

  validates_presence_of :twitter_id, :screen_name, case_sensitive: false
  validates_uniqueness_of :twitter_id, :screen_name
end
