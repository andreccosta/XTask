class AddUrlToDataFile < ActiveRecord::Migration
  def change
  	add_column :data_files, :url, :string
  end
end
