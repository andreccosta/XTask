class TasksController < ApplicationController
	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)

		if @task.save
			redirect_to @task
		else
			render 'new'
		end
	end

	def show
		@task = Task.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to tasks_path, :notice => "Task not found" 
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
