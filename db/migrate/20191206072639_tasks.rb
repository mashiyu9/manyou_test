class Tasks < ActiveRecord::Migration[5.2]
    def change
      add_column :tasks, :importance, :string
      add_column :tasks, :status, :string
      add_column :tasks, :deadline, :string
    end

end
