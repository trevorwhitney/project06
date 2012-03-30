module ApplicationHelper
	
	def user_actions
    if @current_user
      user_actions = "Logged in as " +
        "#{link_to @current_user.full_name, edit_user_path(@current_user)}. "
      if @current_user.is_admin?
        user_actions += link_to "Admin", "/admin"
      else
        user_actions += link_to "My Games", "/members/games"
      end
      user_actions += " #{link_to "Logout", logout_path}"
    else
      user_actions = "#{link_to "Register", new_user_path} | " + 
        "#{link_to "Login", login_path}"
    end

    raw user_actions
	end

  def admin_nav
    if @current_user.is_admin?
      render "admin/admin_nav"
    end
  end

  def print_flash_messages
    message = ""
    if flash[:notice]
      message += "p(notice). "
      message += flash[:notice]
    end
    if flash[:success]
      message += "p(success). "
      message += flash[:success]
    end
    if flash[:error]
      message += "p(error). "
      message += flash[:error]
    end
    raw RedCloth.new(message).to_html
  end

end
