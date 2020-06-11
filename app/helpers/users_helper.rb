module UsersHelper
  def follow_btn(user)
    return if current_user == user

    if current_user.following?(user)
      render 'users/already', user: user
    else
      render 'users/follow_btn', user: user
    end
  end

  def edit_btn(user)
    render 'users/edit_btn', user: user if current_user == user
  end

  def followed(user)
    if current_user.followed(user)
      render 'users/followed', user: current_user.followed(user)
    else
      'You can follow this user!'
    end
  end
end
