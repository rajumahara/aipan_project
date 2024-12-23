module Authentication
  def require_authentication
    restore_authentication || request_authentication
  end

  def restore_authentication
    if session = session_from_cookies
      Current.user = session.user
    end
  end

  def request_authentication
    redirect_to new_session_path
  end

  def sign_in(user)
    session = user.sessions.create(user_agent: request.user_agent, remote_ip: request.remote_ip)
    cookies.signed.permanent[:session_id] = { value: session.id, httponly: true }
  end

  def session_from_cookies
    Session.find_by(id: cookies.signed[:session_id])
  end

  def redirect_if_signed_in
    if restore_authentication
      redirect_to root_path, notice: "you are already signed in!"
    end
  end

  def sign_out
    session = Session.find_by(id: cookies.signed[:session_id])
    session.destroy
    cookies.delete(:session_id)
  end
end
