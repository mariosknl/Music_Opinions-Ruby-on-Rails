module CommentsHelper
  def show_comments(opinion)
    render 'comments/comments', comments: opinion.comments.order(id: :desc)
  end
end
