class ChangeImportanceInTasks < ActiveRecord::Migration[5.2]
  def change
    # remove_culumn :tasks, :importance, :string
    remove_column :tasks, :importance
  end
end
