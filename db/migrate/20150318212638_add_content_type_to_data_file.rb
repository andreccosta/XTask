class AddContentTypeToDataFile < ActiveRecord::Migration
  def change
  	add_column :data_files, :content_type, :string
  	add_column :data_files, :original_filename, :string
  end
end
