class AddImportanceInTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :importance, :integer, default: 0, null: false, limit: 1
  end
end
