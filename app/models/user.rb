class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes, as: :voter
  validates :locale, presence: true, on: :update

  def self.language_options
    {"English" => "en", "Vietnamese" => "vi"}
  end
end
