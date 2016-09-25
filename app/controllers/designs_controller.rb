class DesignsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @designs = Design.all.order("created_at desc")
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)

    if @design.save
      redirect_to @design, notice: "Hellz yeah, Steve! Your artwork was successfully saved!"
    else
      render 'new', notice: "Oh no, Steve! I was unable to save your artwork!"
    end
  end

  def show
    @design = Design.friendly.find(params[:id])
  end

  def edit
    @design = Design.friendly.find(params[:id])
  end

  def update
    @design = Design.friendly.find(params[:id])
    if @design.update design_params
      redirect_to @design, notice: "Huzzah! Your artwork was successfully saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @design = Design.friendly.find(params[:id])
    @design.destroy
    redirect_to designs_path
  end

  private

  def design_params
    params.require(:design).permit(:img_name, :slug, :image, :caption)
  end

end
