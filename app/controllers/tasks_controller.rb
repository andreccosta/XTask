class TasksController < ApplicationController
	def new
		@task = Task.new
	end

	def create
		if current_user.present?
			@user = current_user
			@task = @user.tasks.create(task_params)
		else
			@task = Task.new(task_params)
		end

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
		@task = Task.find(params[:id])
		@task.destroy

		redirect_to tasks_path, :notice => "Task deleted"
	end

	private
		def task_params
			params.require(:task).permit(:name, :body, :priority, :deadline, :progress)
		end
end
