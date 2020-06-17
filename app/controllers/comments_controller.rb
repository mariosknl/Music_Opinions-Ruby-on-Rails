class CommentsController < ApplicationController
  before_action :set_post
  before_action :authorized_user

  def create
    @comment = @opinion.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_back(fallback_location: opinions_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :opinion_id)
  end

  def set_post
    @opinion = Opinion.find(params[:opinion_id])
  end
end
