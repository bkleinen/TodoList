require 'spec_helper'

describe Todo do 
  it "belongs to a user" do
    todo = Todo.create
    todo.should respond_to(:user)
  end
end
