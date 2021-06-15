class ObjectiveComment < ApplicationRecord
  
  validates :comment, presence: true

     belongs_to :objective
     belongs_to :user
end
