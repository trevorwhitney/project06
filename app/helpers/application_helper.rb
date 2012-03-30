module ApplicationHelper

  def currently_logged_in_user
    link_to @current_user.full_name, edit_admin_user_path(@current_user)
  end

  def current_role_link
    if @current_user.is_admin?
      link_to "Admin", "/admin"
    else
      link_to "My Games", "/members/games"
    end
  end

  def admin_nav
    if @current_user.is_admin?
      render "admin/admin_nav"
    end
  end

end
