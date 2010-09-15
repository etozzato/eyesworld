class AppController < ApplicationController
  layout 'blank'
  
  before_filter :login_required
  before_filter :admin_required, :only => [:admin]
  before_filter :no_cache
  
  def index
  end
  
  def admin
  end

  private
  def no_cache
    response.headers["Last-Modified"] = Time.now.httpdate.to_s
    response.headers["Expires"] = '0'
    response.headers["Pragma"] = 'no-cache'
    response.headers["Cache-Control"] = 'no-store, no-cache, must-revalidate, max-age=0, pre-check=0, post-check=0'
  end

  
end
