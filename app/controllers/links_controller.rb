class LinksController < ApplicationController

  before_action :require_sign_in

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def new
    @link = Link.new
    render :new
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to links_url
  end

  def index
    @links = Link.all
    render :index
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end


end
