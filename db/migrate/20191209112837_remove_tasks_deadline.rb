class RemoveTasksDeadline < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :deadline
  end
end
