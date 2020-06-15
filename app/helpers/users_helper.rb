module UsersHelper
  def follow_btn(user)
    return if current_user == user

    if current_user.followings(user)
      render 'users/already', user: user
    else
      render 'users/follow_btn', user: user
    end
  end

  def edit_btn(user)
    render 'users/edit_btn', user: user if current_user == user
  end
end
