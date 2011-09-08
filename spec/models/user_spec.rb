require 'spec_helper'

  def valid_attributes
    {
      :login => 'foo',
      :password => 'barbar',
      :password_confirmation => 'barbar'
    }
  end

describe User do
  it "has many todos" do
    user = User.create! valid_attributes
    user.should respond_to(:todos)
  end
end
