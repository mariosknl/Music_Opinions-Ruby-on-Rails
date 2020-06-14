class OpinionsController < ApplicationController
  before_action :check_authorization

  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.all.order('created_at DESC')
    @opinion = current_user.opinions.build
    @user = current_user
  end

  def new
    @opinion = current_user.opinions.build
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)

    flash[:notice] = if @opinion.save
                       'Opinion shared!'
                     else
                       'Opinion should be less than 150 characters please!'
                     end
    redirect_to opinions_path
  end

  private

  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  def opinion_params
    params.require(:opinion).permit(:author_id, :text)
  end
end
