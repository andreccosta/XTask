class AddProgressToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :progress, :integer
  end
end
