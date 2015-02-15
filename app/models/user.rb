class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, uniqueness: true

	has_many :groups
	has_many :tasks, dependent: :destroy, :foreign_key=>"creator_id", :class_name => "Task"

	def email=(value)
		value = value.strip.downcase
		write_attribute :email, value
	end
end
