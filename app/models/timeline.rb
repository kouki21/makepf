class Timeline < ApplicationRecord
  has_many :users,dependent: :destroy
  
  belongs_to :objective
end
