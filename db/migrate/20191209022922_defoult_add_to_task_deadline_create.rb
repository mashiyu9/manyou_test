class DefoultAddToTaskDeadlineCreate < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline, :datetime, :default => Date.today
  end
end
