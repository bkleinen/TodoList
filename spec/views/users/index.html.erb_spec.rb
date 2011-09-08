require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :login => "Login",
        :persistence_token => "Persistence Token",
        :crypted_password => "Crypted Password",
        :password_salt => "Password Salt"
      ),
      stub_model(User,
        :login => "Login",
        :persistence_token => "Persistence Token",
        :crypted_password => "Crypted Password",
        :password_salt => "Password Salt"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Persistence Token".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Crypted Password".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
  end
end
