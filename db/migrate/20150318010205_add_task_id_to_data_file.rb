class AddTaskIdToDataFile < ActiveRecord::Migration
  def change
  	add_reference :data_files, :task, index: true
  end
end
