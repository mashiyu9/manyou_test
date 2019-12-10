class ChangeCulmnTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :content, :text, null: false
    change_column :tasks, :deadline, :datetime, null: false
  end
end
