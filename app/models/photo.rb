class Photo < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, dependent: :destroy
  belongs_to :user
  translates :caption

  def liked_by!(user)
    # create a new vote associating user and photo
    raise "Already liked" if liked_by?(user)
    votes.where(voter: user).create!
  end

  def unliked_by!(user)
    raise "Not yet liked" unless liked_by?(user)
    votes.where(voter: user).first.destroy
  end

  def liked_by?(user)
    votes.exists?(voter: user)
  end

  def likes_count
    # votes.length
    # votes.count
    votes.size
  end

  def self.import_from_instagram
    Instagram.client.media_popular.each do |item|
      @record = Photo.create username: item.user.username, caption: item.caption.try(:text), url: item.images.low_resolution.url
    end
  end
end
