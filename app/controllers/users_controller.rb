class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :req_login, only: [:show, :edit, :update, :destroy]

  def show
    unless current_user.id == @user.id
      redirect_to tasks_path
    end
  end

  def new
    redirect_to tasks_path if logged_in?
    @user = User.new
  end

  def edit
    unless current_user.id == @user.id
      redirect_to tasks_path
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: t('view.succes_create_user')
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def req_login
      unless logged_in?

        redirect_to new_session_path
      end
    end
end
