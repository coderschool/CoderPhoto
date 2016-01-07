class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo

  validates :body, :user, :photo, presence: true
end
