	class Task < ActiveRecord::Base
	has_many :subtasks, class_name: "Task", :foreign_key => "parent_task_id", dependent: :destroy
	belongs_to :parent, class_name: "Task", :foreign_key => "parent_task_id"

	belongs_to :creator, :foreign_key => "creator_id", :class_name => "User"
	validates :name, presence: true

	def self.search(search)
		if search
			tasks = Task.arel_table
			Task.where(tasks[:name].matches("%#{search}%"))
		else
			all
		end
	end
end
