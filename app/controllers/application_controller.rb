class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  def login_required
    redirect_to new_session_path unless current_user
  end
end
