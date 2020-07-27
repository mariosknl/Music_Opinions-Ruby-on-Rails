class OpinionsController < ApplicationController
  before_action :authorized_user
  def index
    @opinions = current_user.opinions_showing.includes(:user, :comments)
    @opinion = current_user.opinions.build
    @users = User.all
    @user = current_user
    @comment = Comment.new
  end

  def new
    @opinion = current_user.opinions.build
  end

  def create
    @opinion = current_user.opinions.new(opinion_params)

    flash[:notice] = if @opinion.save
                       'Opinion shared!'
                     else
                       'Opinion should be less than 150 characters please!'
                     end
    redirect_to opinions_path
  end

  private

  def opinion_params
    params.require(:opinion).permit(:author_id, :text)
  end
end
