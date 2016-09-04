class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all.order("created_at desc")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Hellz yeah, Steve! That project was successfully saved!"
    else
      render 'new', notice: "Oh no, Steve! I was unable to save your project!"
    end
  end

  def show
  end

  private

  def find_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :link, :slug)
  end
end
