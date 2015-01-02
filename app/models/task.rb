class Task < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, length: { minimum: 3}
	validates :body, presence: true, length: { minimum: 5}
end
