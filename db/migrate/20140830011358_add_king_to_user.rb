class AddKingToUser < ActiveRecord::Migration
  def change
    add_column :users, :king, :boolean, :default => false
  end
end
