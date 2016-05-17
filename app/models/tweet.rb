class Tweet < ApplicationRecord
  belongs_to :user
  has_many :media_files
end
