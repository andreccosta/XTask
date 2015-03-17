class AddParentRefToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :parent_task_id, :integer
  end
end
