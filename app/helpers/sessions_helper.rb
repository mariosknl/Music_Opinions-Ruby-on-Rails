module SessionsHelper
  def current_user
    User.find(current_user_id) if signed_in?
  end

  def current_user_id
    session[:current_user_id]
  end

  def signed_in?
    session[:current_user_id].nil? ? false : true
  end

  def create_session(user_id)
    session[:current_user_id] = user_id
  end

  def create_session_and_redirect(user)
    create_session(user.id)
    redirect_to user_path(user)
  end
end
