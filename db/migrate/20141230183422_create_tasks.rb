class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :body
      t.integer :priority
      t.integer :progress

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
