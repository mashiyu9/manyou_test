class AddIndexTasksTitle < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :title, :string, index: true 
  end
end
