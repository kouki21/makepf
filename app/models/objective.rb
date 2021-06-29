class Objective < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 200 }

  belongs_to :user

  has_many :objective_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
