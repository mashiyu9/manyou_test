class Task < ApplicationRecord



  def self.tasks_order_desc
    self.all.order(created_at: :desc)
  end
end
