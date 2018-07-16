class SitesController < ApplicationController
  before_action :current_user
  before_action :validate_user_info
  skip_before_action :validate_user_info, only: [:show]
  skip_before_action :current_user, only: [:show]

  def show
    #raise params.inspect

    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def index
    @sites = Site.all
  end

  def create
    @site = Site.create(site_params)
    if @site.valid?
      @site.save
      redirect_to site_path(@site)
    else
      flash[:message] = "Please ensure that at the very least, your site has a name."
      redirect_to new_site_path
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    @site.update(site_params)
    if @site.save
      redirect_to site_path(@site)
    else
      render :edit
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to user_path(current_user)
  end

  def recent
    @sites = Site.recent
    render action: :index
  end

  #def active
  #  @sites = Site.active
  #  render action: :index
  #end


  private

  def site_params
    params.require(:site).permit(
      :user_id,
      :name,
      :street_address,
      :city,
      :zip_code,
      :contact_info,
      :accessibility,
      :site_info,
      :image,
      #:site_windows_count
    )
  end
end
