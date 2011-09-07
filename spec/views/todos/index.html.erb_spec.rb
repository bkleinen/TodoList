require 'spec_helper'

describe "todos/index.html.erb" do
  before(:each) do
    assign(:todos, [
      stub_model(Todo,
        :title => "Title",
        :description => "Description",
        :status => true,
        :due => "2008-08-20"
      ),
      stub_model(Todo,
        :title => "Title",
        :description => "Description",
        :status => true,
        :due => "2008-08-20"
      )
    ])
  end

  it "renders a list of todos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "2008-08-20".to_s, :count => 2
  end
end
