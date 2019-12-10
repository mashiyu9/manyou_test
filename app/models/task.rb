class Task < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :importance, presence: true
  validates :status, presence: true
  validates :deadline, presence: true
  validates :content, presence: true

  def self.tasks_order_desc_created_at
    self.all.order(created_at: :desc)
  end

  def self.tasks_order_asc_deadline
    self.all.order(deadline: :asc)
  end

end
