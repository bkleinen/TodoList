class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.find_all_by_status(false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])
    @current_user = current_user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :ok }
    end
  end


  # GET /assign/
  def assign
    @todo = Todo.find(params[:id])
    @todo.user = current_user if current_user
    respond_to do |format|
      if     @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { redirect_to @todo, notice: 'Todo was not updated!' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end


  end

  # GET /toggle_status/
  def toggle_status
    @todo = Todo.find(params[:id])
    if @todo.status
      @todo.status = false
    else
      @todo.status = true
    end

      respond_to do |format|
      if     @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { redirect_to @todo, notice: 'Todo was not updated!' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end


  end

end


