module UsersHelper

  def username_text_field(form)
    if current_user.is_admin?
      form.text_field :username
    else
      form.text_field :username, :disabled => true
    end
  end

  def user_roles
    current_user.role_symbols.compact.join(", ").to_s.humanize
  end

end
