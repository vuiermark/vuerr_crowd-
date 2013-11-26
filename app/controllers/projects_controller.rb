class ProjectsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.upcoming
	end

	def show
		@project = Project.find(params[:id])
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
		  redirect_to @project, notice: "Campaign successfully updated!"
		else
			render :edit
		end
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
		  redirect_to @project, notice: "Campaign successfully created"
		else
			render :new
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_url, alert: "Campaign successfully deleted!"
	end

private

	def correct_user
		@project = current_user.Project.find(params[:id])
		redirect_to projects_path, notice: "Not authorized to edi this project" if @project.nil?
	end

	def project_params
		project_params = params.require(:project).
									permit(:name, :description, :youtube_channel, :title, :funding_goal, :monthly_funding_goal, :deadline, :long_description, :city, :country, :image_file_name, :video, :featured)
	end
end
