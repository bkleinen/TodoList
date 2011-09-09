require 'spec_helper'

describe "todos/show.html.erb" do
  before(:each) do

    @todo = assign(:todo, stub_model(Todo,
      :title => "Title",
      :description => "Description",
      :status => false,
      :due => "2008-12-31"
    ))


    @current_user = User.create(:login => 'foo', :password => 'barb', :password_confirmation => 'barb')

  end


 
  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/2008-12-31/)
  end
end
