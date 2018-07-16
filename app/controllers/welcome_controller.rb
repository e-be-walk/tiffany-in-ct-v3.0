class WelcomeController < ApplicationController

  def about
  end

  def index
    #@users = User.all
    @sites = Site.all
    #@windows = Window.all
    @user = User.find_by(params[:user_id])
    @site = Site.find_by(params[:id])
    #@window = Window.find_by(params[:id])
  end
end
