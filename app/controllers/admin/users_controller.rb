class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :index, :create, :edit, :update, :destroy, :show]

  def new
    @user = User.new
  end

  def index
    @users = User.select(:id, :name, :email, :admin, :created_at).order("created_at DESC")
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: t('admin.create_user')
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
  end

  def show
    # @tasks = Task.all.includes(:user)
    # @tasks = Task.all
    # @tasks = Task.includes(:user).where(user_id: @user.id)
    @tasks = @user.tasks
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
  if logged_in?
    unless current_user.admin?
      redirect_to tasks_path
    end
  else
    redirect_to tasks_path
  end
end

end