class Task < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :importance, presence: true
  validates :status, presence: true
  validates :deadline, presence: true
  validates :content, presence: true

  def self.tasks_order_desc
    self.all.order(created_at: :desc)
  end

end
