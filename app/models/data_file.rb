class DataFile < ActiveRecord::Base
	belongs_to :task

	attr_accessor :upload

	def self.save(upload)
		file_name = upload['file'].original_filename  if  (upload['file'] !='')    
		file = upload['file'].read    

		file_type = file_name.split('.').last
		new_name_file = Time.now.to_i
		name_folder = self.task.id
		new_file_name_with_type = "#{new_name_file}." + file_type

	    Dir.mkdir("storage/#{name_folder}/uploads");
	      File.open("storage/#{name_folder}/uploads/" + new_file_name_with_type, "wb")  do |f|  
	        f.write(file) 
	      end
		end
end
