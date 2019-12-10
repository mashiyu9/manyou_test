class ChangeCulmnNullTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :importance, :string, null: false
    change_column :tasks, :status, :string, null: false
    change_column :tasks, :deadline, :string, null: false
  end
end
