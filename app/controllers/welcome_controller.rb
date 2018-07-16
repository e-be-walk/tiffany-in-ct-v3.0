class WelcomeController < ApplicationController

  def about
  end

  def index
    #@users = User.all
    @sites = Site.all
    #@windows = Window.all
    @site = Site.find_by(params[:id])
    #@window = Window.find_by(params[:id])
  end
end
