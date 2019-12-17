class AddIndexTaskTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, [:id, :title, :status, :importance]
  end
end
