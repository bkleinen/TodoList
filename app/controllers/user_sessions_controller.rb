class UserSessionsController < ApplicationController
  # GET /user_sessions
  # GET /user_sessions.json
  def index
    @user_sessions = []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_sessions }
    end
  end

  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        flash[:notice] = "Successfully logged in!"
        format.html { redirect_to user_path(current_user), notice: 'User session was successfully created.' }
        format.json { render json: @user_session, status: :created, location: @user_session }
      else
        format.html { render action: "new" }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out!"
    respond_to do |format|
      format.html { redirect_to user_sessions_url }
      format.json { head :ok }
    end
  end
end
