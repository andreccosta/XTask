class Task < ActiveRecord::Base
	belongs_to :creator, :foreign_key => "creator_id", :class_name => "User"
	validates :name, presence: true, length: { minimum: 3}
	validates :body, presence: true, length: { minimum: 5}
end
