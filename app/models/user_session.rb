class UserSession < Authlogic::Session::Base
  attr_accessor :login, :password
  #returns session key
  def to_key
    [session_key]
  end
end
