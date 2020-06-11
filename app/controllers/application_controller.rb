class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def authorized_user
    redirect_to new_session_path unless signed_in?
  end
end
