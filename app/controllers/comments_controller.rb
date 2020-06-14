class CommentsController < ApplicationController
  def index
    @opinion = Opinion.find([:opinion_id])
  end

  def create
    @opinion = Opinion.find([:opinion_id])
    @comment = @opinion.comments.create(comment_params)
    redirect_to opinions_path
  end

  def destroy
    @opinion = Opinion.find(params[:opinion_id])
    @comment = @opinion.comments.find(params[:id])
    @comment.destroy
    redirect_to opinions_path
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment, :opinion_id)
  end
end
