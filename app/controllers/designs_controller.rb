class DesignsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @designs = Design.all.order("created_at desc")
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(post_params)

    if @design.save
      redirect_to @design, notice: "Hellz yeah, Steve! Your artwork was successfully saved!"
    else
      render 'new', notice: "Oh no, Steve! I was unable to save your artwork!"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @design.update post_params
      redirect_to @design, notice: "Huzzah! Your artwork was successfully saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @design.destroy
    redirect_to designs_path
  end

  private

  def post_params
    params.require(:design).permit(:img_name, :slug, :image, :caption)
  end

  def find_post
    @design = Design.friendly.find(params[:id])
  end
end
