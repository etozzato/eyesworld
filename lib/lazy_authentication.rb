module LazyAuthentication
  
  KEY_EXPIRATION = 1.hour
  SIGNUP_POLICY = :moderated # [:open, :moderated, :invite_only]
  
  protected
  
  def generate_key(base, u)
    u.update_attributes({
      :session_key => Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join), 
      :session_key_expires_on => Time.now.in(KEY_EXPIRATION)})
      UserMailer.deliver_session_key(u, base.request.host)
  end
  
  def self.create_session(base, email)
    
    msg = {
      :user_not_found => "Utente non trovato.",
      :user_in_queue => "Richiesta di attivazione inviata all'amministratore.",
      :session_key_sent => "Codice di autorizzazione inviato a %s.",
    }
    
    u = User.find_by_email(email)
    
    begin
      case SIGNUP_POLICY
      
        when :open
          if not u
            u = User.new(:email => email, :active => 1)
            u.save!
            generate_key(base, u)
          else
            generate_key(base, u)
          end
          return :notice, format(msg[:session_key_sent], u.email)
      
        when :moderated
          if not u
            u = User.new(:email => email, :active => 0)
            u.save!
            return :warning, msg[:user_in_queue]
          else
            if u.active?
              generate_key(base, u)
              return :notice, format(msg[:session_key_sent], u.email)
            else
              return :warning, msg[:user_in_queue]
            end
          end
      
        when :invite_only
          if not u
            return :error, msg[:user_not_found]
          else
            generate_key(base, u)
            return :notice, format(msg[:session_key_sent], u.email)
          end
        
      end
    rescue => ex
      return :error, ex
    end
  end
  
  def self.login(base, key)
    u = User.find_by_session_key(key)
    return :error, "Sessione non valida." unless u
    u.update_attributes({:session_key => nil, :session_key_expires_on => nil})
    base.current_user = u
    return :notice, "Benvenuto!"
  end
  
  def self.force_login(base, email)
    u = User.find_by_email(email)
    return :error, "Email non trovata." unless u
    u.update_attributes({:session_key => nil, :session_key_expires_on => nil})
    base.current_user = u
    return :notice, "Benvenuto!"
  end
  
  def self.pwd_login(base, email, pwd)
    u = User.find_by_email_and_password(email, pwd)
    return :error, "Password/Email errata." unless u
    u.update_attributes({:session_key => nil, :session_key_expires_on => nil})
    base.current_user = u
    return :notice, "Benvenuto!"
  end
  
  def self.logout(base)
    @current_user = false
    base.session[:user_id] = nil
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= login_from_session unless @current_user == false
  end

  def current_user=(new_user)
    session[:user_id] = new_user ? new_user.id : nil
    @current_user = new_user || false
  end
  
  def login_from_session
    self.current_user = User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  def login_required
    logged_in? || access_denied
  end
  
  def access_denied
    flash[:error] = "Effettuare la log-in!"
    redirect_to homepage_url
  end
  
  def self.included(base)
    base.send :helper_method, :current_user, :logged_in? if base.respond_to? :helper_method
  end
  
end