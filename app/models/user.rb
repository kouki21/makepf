class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :objectives, dependent: :destroy
        has_many :objective_comments, dependent: :destroy

        has_many :favorites, dependent: :destroy

        has_many :likes, dependent: :destroy
        has_many :liked_objectives, through: :likes, source: :objective

        has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
        has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

        has_many :following_user, through: :follower, source: :followed
        has_many :follower_user, through: :followed, source: :follower

        attachment :profile_image
        attachment :image


        def follow(user_id)
          follower.create(followed_id: user_id)
        end

        def unfollow(user_id)
          follower.find_by(followed_id: user_id).destroy
        end

        def following?(user)
          following_user.include?(user)
        end
end
