class AddIndexTaskTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, [:id, :title, :status]
  end
end
