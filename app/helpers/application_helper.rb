module ApplicationHelper
  def sign_out_links
    if signed_in?
      render 'sessions/sign_out'
    else
      render 'sessions/sign_in'
    end
  end

  private

  def sign_up_links
    render 'sessions/sign_up'
  end
end
