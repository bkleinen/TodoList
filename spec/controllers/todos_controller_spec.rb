require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TodosController do

  # This should return the minimal set of attributes required to create a valid
  # Todo. As you add validations to Todo, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all open todos as @todos" do
      todo_open = Todo.create! valid_attributes
      todo_closed = Todo.create! valid_attributes.merge(:status => true)
      get :index
      assigns(:todos).should eq([todo_open])
    end
  end

  describe "GET show" do
    it "assigns the requested todo as @todo" do
      todo = Todo.create! valid_attributes
      get :show, :id => todo.id.to_s
      assigns(:todo).should eq(todo)
    end
  end

  describe "GET new" do
    it "assigns a new todo as @todo" do
      get :new
      assigns(:todo).should be_a_new(Todo)
    end
  end

  describe "GET edit" do
    it "assigns the requested todo as @todo" do
      todo = Todo.create! valid_attributes
      get :edit, :id => todo.id.to_s
      assigns(:todo).should eq(todo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Todo" do
        expect {
          post :create, :todo => valid_attributes
        }.to change(Todo, :count).by(1)
      end

      it "assigns a newly created todo as @todo" do
        post :create, :todo => valid_attributes
        assigns(:todo).should be_a(Todo)
        assigns(:todo).should be_persisted
      end

      it "redirects to the created todo" do
        post :create, :todo => valid_attributes
        response.should redirect_to(Todo.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved todo as @todo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Todo.any_instance.stub(:save).and_return(false)
        post :create, :todo => {}
        assigns(:todo).should be_a_new(Todo)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Todo.any_instance.stub(:save).and_return(false)
        post :create, :todo => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested todo" do
        todo = Todo.create! valid_attributes
        # Assuming there are no other todos in the database, this
        # specifies that the Todo created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Todo.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => todo.id, :todo => {'these' => 'params'}
      end

      it "assigns the requested todo as @todo" do
        todo = Todo.create! valid_attributes
        put :update, :id => todo.id, :todo => valid_attributes
        assigns(:todo).should eq(todo)
      end

      it "redirects to the todo" do
        todo = Todo.create! valid_attributes
        put :update, :id => todo.id, :todo => valid_attributes
        response.should redirect_to(todo)
      end
    end

    describe "with invalid params" do
      it "assigns the todo as @todo" do
        todo = Todo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Todo.any_instance.stub(:save).and_return(false)
        put :update, :id => todo.id.to_s, :todo => {}
        assigns(:todo).should eq(todo)
      end

      it "re-renders the 'edit' template" do
        todo = Todo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Todo.any_instance.stub(:save).and_return(false)
        put :update, :id => todo.id.to_s, :todo => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested todo" do
      todo = Todo.create! valid_attributes
      expect {
        delete :destroy, :id => todo.id.to_s
      }.to change(Todo, :count).by(-1)
    end

    it "redirects to the todos list" do
      todo = Todo.create! valid_attributes
      delete :destroy, :id => todo.id.to_s
      response.should redirect_to(todos_url)
    end
  end

end
