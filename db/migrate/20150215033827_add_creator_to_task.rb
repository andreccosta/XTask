class AddCreatorToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :creator, index: true
  end
end
