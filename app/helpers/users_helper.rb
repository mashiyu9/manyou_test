module UsersHelper

  def confirm_new_or_edit
    unless @user.id?
      admin_users_path
    else
      admin_user_path
    end

  end
end