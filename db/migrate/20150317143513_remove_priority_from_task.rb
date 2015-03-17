class RemovePriorityFromTask < ActiveRecord::Migration
  def change
  	remove_column :tasks, :priority
  end
end
