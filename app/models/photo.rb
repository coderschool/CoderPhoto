class Photo < ActiveRecord::Base
  has_many :votes, as: :votable, dependent: :destroy

  def liked_by!(user)
    raise "Already liked" if liked_by?(user)
    votes.where(voter: user).create!
  end

  def unliked_by!(user)
    raise "Not liked" unless liked_by?(user)
    votes.where(voter: user).first.destroy
  end

  def liked_by?(user)
    votes.exists?(voter: user)
  end

  def likes_count
    votes.count
  end
end
