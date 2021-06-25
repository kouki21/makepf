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

        has_many :following_users, through: :follower, source: :followed
        has_many :follower_users, through: :followed, source: :follower

        attachment :profile_image

        validates :name, uniqueness: true, length: { in: 2..20 }

        def follow(user_id)
          follower.create(followed_id: user_id)
        end

        def unfollow(user_id)
          follower.find_by(followed_id: user_id).destroy
        end

        def following?(user)
          following_users.include?(user)
        end

        def all_following
          Relationship.joins(followed: :objectives).select("objectives.*", "relationships.followed_id").where(follower_id: id).order("objectives.created_at DESC")
        end
end
