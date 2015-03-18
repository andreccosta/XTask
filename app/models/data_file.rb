class DataFile < ActiveRecord::Base
	belongs_to :task

	def download
		send_file(url)
	end

	def save_file(upload)
		file_name = upload.original_filename  if  (upload !='')    
		file = upload.read    

		file_type = file_name.split('.').last
		new_name_file = Time.now.to_i
		new_file_name_with_type = "#{new_name_file}." + file_type

      	File.open("storage/#{new_file_name_with_type}", "wb")  do |f|  
        	f.write(file) 
		end

		return "storage/#{new_file_name_with_type}"
	end
end
