class Photo < ActiveRecord::Base
  translates :caption
  has_many :votes, as: :votable
  has_many :comments, dependent: :destroy

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
end
