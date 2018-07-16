class CommentsController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :destroy]

  def new
    @site = Site.find(params[:site_id])
    @comments = Comment.new
  end

  def create
    #@user = current_user
    @site = Site.find(params[:site_id])
    @comment = Comment.create(comment_params)
    if @comment.valid?
      @comment.save
      @site.comments << @comment
      redirect_to site_path(@site)
    else
      flash[:message] = "Please enter a comment."
      redirect_to new_site_comment_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_path(current_user)
  end

  private

  def user_comment_params
    params.require(:user_comment).permit(
      :comment_text
    )
  end

end
