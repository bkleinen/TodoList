require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :login => "MyString",
      :persistence_token => "MyString",
      :crypted_password => "MyString",
      :password_salt => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_login", :name => "user[login]"
      assert_select "input#user_persistence_token", :name => "user[persistence_token]"
      assert_select "input#user_crypted_password", :name => "user[crypted_password]"
      assert_select "input#user_password_salt", :name => "user[password_salt]"
    end
  end
end
