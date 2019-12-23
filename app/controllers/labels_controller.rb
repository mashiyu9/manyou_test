class LabelsController < ApplicationController
  before_action :req_login, only: [:new, :create, :destroy]
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    @label.user_id = current_user.id
    if @label.save
      redirect_to new_label_path, notice: t('label.succese_label')
    else
      render :new
    end
  end

  def destroy
  end

  private

  def label_params
    params.require(:label).permit(:series)
  end

  def req_login
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
