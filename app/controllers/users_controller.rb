class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except:[:new, :create] 

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def enrollment
    if logged_in?
      @courses = User.find(current_user.id).courses
      render 'users/profile'
    else
      render 'sessions/new'
    end
  end

  def enroll

    if Enrollment.where(user_id: current_user.id, course_id: params[:course_id]).size == 0
      user = current_user
      course = params[:course_id]
      Enrollment.create(user_id: user.id, course_id: course)
      flash[:notice] = "Successfully Enrolled"
      redirect_to profile_path

    else
      flash[:notice] = "Already enrolled"
      redirect_to search_path

    end
  end

  def drop
    Enrollment.where(user_id: current_user.id, course_id: params[:course_id]).first.destroy
    flash[:notice] = "Course drop successfully"
    redirect_to profile_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
