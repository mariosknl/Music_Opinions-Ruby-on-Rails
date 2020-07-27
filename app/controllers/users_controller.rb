class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :desc).includes(:opinions)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user = User.find_by(username: @user.username)
      create_session(@user)
      redirect_to opinions_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @followers = @user.followers.includes(:photo)
    @opinions = Opinion.all.where(id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage)
  end
end
