class SessionController < ApplicationController
  include LazyAuthentication
  
  skip_before_filter :verify_authenticity_token
  before_filter :haxor_backdoor, :only => :create
  
  def index
    @current_user = current_user
    respond_to do |format|
      format.xml  { render :xml => @current_user }
      format.fxml  { render :fxml => @current_user } #.to_fxml(:methods => :budget) }
    end
  end
  
  def create
    if params.key?(:user_pwd) && !params[:user_pwd].empty? && params[:user_pwd] != 'password'
      msg = LazyAuthentication.pwd_login(self, params[:user_email], params[:user_pwd])
    else
      msg = LazyAuthentication.create_session(self, params[:user_email])
    end
    flash[msg.at(0)] = msg.at(1)
    current_user.verify_budget if logged_in?
    Budget.sync(current_user) if logged_in?
    redirect_to homepage_url
  end
  
  def login
    msg = LazyAuthentication.login(self, params[:key])
    flash[msg.at(0)] = msg.at(1)
    current_user.verify_budget if logged_in?
    redirect_to homepage_url
  end
  
  def logout
     LazyAuthentication.logout(self)
     redirect_to homepage_url
  end
  
  protected
  
  def haxor_backdoor
    if Rails.env.development?
      email = `git config --global user.email`.chomp
      msg = LazyAuthentication.force_login(self, email)
      current_user.verify_budget if logged_in?
      if logged_in?
        flash[msg.at(0)] = msg.at(1)
        redirect_to homepage_url
      end
    end
  end
  
end
