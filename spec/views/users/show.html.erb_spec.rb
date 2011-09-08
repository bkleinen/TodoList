require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :login => "Login",
      :persistence_token => "Persistence Token",
      :crypted_password => "Crypted Password",
      :password_salt => "Password Salt"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Login/)
  end
end
