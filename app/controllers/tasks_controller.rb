class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :req_login, only: [:new, :create, :index, :edit, :update, :destroy]

  # GET /tasks
  def index
    if params[:sort_expired] == "true"
      @tasks = Task.page(params[:page]).per(5).where(user_id: current_user.id).asc_deadline
    elsif params[:sort_importance] == "true"
      @tasks = Task.page(params[:page]).per(5).where(user_id: current_user.id).desc_importance
    elsif params[:sort_title] || params[:sort_status]
      # @tasks = Task.where(['title LIKE ? AND status LIKE ?', "%#{params[:sort_title]}%", "#{params[:sort_status]}"])
      @tasks = Task.page(params[:page]).per(5).where(user_id: current_user.id).where_like_status_title(params[:sort_title], params[:sort_status])
    else
      # @tasks = Task.page(params[:page]).per(5).desc_created
      @tasks = Task.page(params[:page]).per(5).where(user_id: current_user.id).desc_created
    end

    @tasks_sort = Task.new
  end

  def search
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    # @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task, notice: t('layout.success_task')
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: t('layout.edit_task')
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: t('layout.destroy_task')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:title, :content, :status, :importance, :deadline, :sort_expired)
  end

  def req_login
    unless logged_in?
      redirect_to new_session_path
    end
  end



end
