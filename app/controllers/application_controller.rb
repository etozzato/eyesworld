include LazyAuthentication
class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  def admin_required
    redirect_to homepage_url and return unless logged_in? && current_user.admin?
  end

end
