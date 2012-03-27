module ApplicationHelper
	
	def user_actions
		link_to "Register", new_user_path
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
