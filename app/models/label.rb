class Label < ApplicationRecord
  has_many :relations
  has_many :tasks, through: :relations
  belongs_to :user

  validates :user_id, uniqueness: { scope: :series}
  
end
