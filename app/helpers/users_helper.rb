module UsersHelper

  def username_text_field(form)
    if @current_user.is_admin?
      form.text_field :username
    else
      form.text_field :username, :disabled => true
    end
  end

end
