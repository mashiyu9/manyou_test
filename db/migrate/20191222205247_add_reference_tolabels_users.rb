class AddReferenceTolabelsUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :labels, :user, foreign_key: true
    add_index :labels, [:user_id, :series], :unique => true, :name => 'user_id_series_index'
  end
end
