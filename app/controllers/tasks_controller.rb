class TasksController < ApplicationController
	def new
		if !current_user.present?
			redirect_to login_path, :notice => "You need to login before creating a task"
			return
		end
		@task = Task.new
	end

	def create
		if current_user.present?
			@user = current_user
			@task = @user.tasks.create(task_params)
		else
			redirect_to login_path, :notice => "You need to login before creating a task"
			return
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
		@tasks = Task.search(params[:search])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])

		if @task.update(task_params)
			redirect_to @task
		else
			render 'edit'
		end
	end

	def destroy
		@task = Task.find(params[:id])

		if(current_user == @task.user)
			@task.destroy
			redirect_to tasks_path, :notice => "Task deleted"
		else
			redirect_to tasks_path, :notice => "You can't delete this task!" 
		end
	end

	private
		def task_params
			params.require(:task).permit(:name, :body, :priority, :deadline, :progress)
		end
end
