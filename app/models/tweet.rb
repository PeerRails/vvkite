class Tweet < ApplicationRecord
  belongs_to :user
  has_many :media_files

  validates_presence_of :tweet_id, :twitter_id, :link, :media_type, :user_id
  validates_uniqueness_of :link, :tweet_id
  validates :media_type, inclusion: { in: %w(photo gif video) }

  def self.add_status(status)
    media = nil
    user = nil

    case status.media.first.class.to_s
    when /Video/
      media = "video"
    when /gif/
      media = "gif"
    when /Photo/
      media = "photo"
    end

    user = User.find_or_create_by(twitter_id: status.user.id) do |u|
      u.twitter_id = status.user.id
      u.screen_name = status.user.screen_name
    end

    Tweet.create(
      tweet_id: status.id,
      twitter_id: status.user.id,
      link: status.uri.to_s,
      text: status.full_text,
      media_type: media,
      user_id: user.id
      )
  end
end
