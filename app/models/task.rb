class Task < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3}
	validates :body, presence: true, length: { minimum: 5}
end
