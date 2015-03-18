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
			@task = Task.new(task_params)
			@task.creator = current_user
			if params[:task].has_key?(:parent_id)
				@task.parent = Task.find(params[:task][:parent_id])
			end
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
		@tasks = current_user.tasks.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
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

	def download
		@file = DataFile.find(params[:id])
		send_file(@file.url)
	end

	def upload
		@task = Task.find(params[:id])
		@file = @task.files.new

		@file.url = @file.save_file(params[:task][:file])

		@file.save

		redirect_to tasks_path(@task)
	end

	def destroy
		@task = Task.find(params[:id])

		if(current_user == @task.creator)
			@task.destroy
			redirect_to tasks_path, :notice => "Task deleted"
		else
			redirect_to tasks_path, :notice => "You can't delete this task!" 
		end
	end

	private
		def task_params
			params.require(:task).permit(:name, :body, :priority, :deadline, :progress, :creator, :task_parent_id, :file)
		end
end
