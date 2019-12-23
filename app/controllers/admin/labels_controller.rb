class Admin::LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Labels.new(label_params)
    if @label.save
      redirect_to admin_users_path, notice: t('admin.create_user')
    else
      render :new
    end

  end

  private

  def label_params
    params.require(:label).permit(:series)
  end

end
