class TasksController < ApplicationController
	def new
	end

	def create
		@task = Task.new(task_params)

		@task.save
		redirect_to @task
	end

	def show
		@task = Task.find(params[:id])
	end

	def index
		@tasks = Task.all
	end	

	def destroy
	end

	private
		def task_params
			params.require(:task).permit(:name, :body)
		end
end
