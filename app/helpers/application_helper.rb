module ApplicationHelper
  def sign_out_links
    if signed_in?
      render 'sessions/sign_out'
    else
      render 'sessions/sign_in'
    end
  end

  private

  def class_namer(path, color)
    current_path == path ? "nav-link text-#{color}" : 'nav-link'
  end

  def current_path
    request.env['PATH_INFO']
  end

  def sign_up_links
    render 'sessions/sign_up' unless signed_in?
  end
end
