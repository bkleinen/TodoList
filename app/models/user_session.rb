class UserSession < Authlogic::Session::Base
  #returns session key
  def to_key
    [session_key]
  end
end
