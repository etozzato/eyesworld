class UserMailer < ActionMailer::Base
  def session_key(user, host)
    setup_email(user)
    @subject    += "Login Authorization"
    @body[:url]  = login_url(user.session_key, :host => host)
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "Login Authorization <noreply@deezney.com>"
      @subject     = ""
      @sent_on     = Time.now
      @body[:u] = user
    end
end
