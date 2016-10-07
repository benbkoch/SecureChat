class AddReadEachToUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :messages, :read, :boolean
  	remove_column :users, :read, :boolean
    add_column :messages, :read_by_1, :boolean, default: false
    add_column :messages, :read_by_2, :boolean, default: false
  end
end
