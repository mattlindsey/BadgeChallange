class User < ActiveRecord::Base
  acts_as_decorables

  belongs_to :company

  has_many :badge_users
  has_many :badges, through: :badge_users

  has_many :video_users
  has_many :videos, through: :video_users

  def to_s
    name
  end

  def watch_video video

    videos << video          #Record every viewing instance (TODO: refactor this)
    return if watched? video #Already got credit for this video

    if video.name == "Ruby classes"
      bname = "SpeedRun"
    else
      video_count = videos.count
      total_videos = Video.count
      if video_count == 2
        bname = "Half-Way"
      elsif video_count == total_videos
        bname = "All-Way"
      end
    end

    b = Badge.find_by_name(bname)

    #Make sure user doesn't already have the badge to be safe
    if !b.nil? && BadgeUser.count(:conditions => ["user_id = ? and badge_id = ?", id, b.id])
      bu = BadgeUser.create({:badge_id => b.id, :user_id => id})
    end
  end

  def watched? video
    videos.include? video
  end
end
