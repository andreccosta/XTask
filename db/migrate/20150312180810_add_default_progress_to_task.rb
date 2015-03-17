class AddDefaultProgressToTask < ActiveRecord::Migration
  def change
  	change_column :tasks, :progress, :integer, :default => 0
  end
end
