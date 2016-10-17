class Video < ActiveRecord::Base
  validates_presence_of :name
  has_many :video_users
  has_many :users, through: :video_users
end
