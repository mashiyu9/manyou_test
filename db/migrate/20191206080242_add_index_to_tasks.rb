class AddIndexToTasks < ActiveRecord::Migration[5.2]
  def up
    remove_column :tasks, :deadline
      end

  def down
    add_column :tasks, :deadline, :string
  end
end
