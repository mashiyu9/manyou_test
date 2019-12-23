class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :series, null: false
      t.timestamps
    end
    add_index :labels, :series, unique: true
  end
end
