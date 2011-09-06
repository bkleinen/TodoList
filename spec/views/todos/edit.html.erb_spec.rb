require 'spec_helper'

describe "todos/edit.html.erb" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :title => "MyString",
      :description => "MyString",
      :status => false
    ))
  end

  it "renders the edit todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todos_path(@todo), :method => "post" do
      assert_select "input#todo_title", :name => "todo[title]"
      assert_select "input#todo_description", :name => "todo[description]"
      assert_select "input#todo_status", :name => "todo[status]"
    end
  end
end
