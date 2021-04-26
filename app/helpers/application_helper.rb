module ApplicationHelper
  def navbar_link_name
    link_to current_user.name, class: 'nav-link' if logged_in?
  end

  def navbar_link_logout
    link_to '| Logout', logout_path, method: :delete, class: 'nav-link' if logged_in?
  end

  def navbar_link_sign_up
    link_to 'Sign Up', signup_path, class: 'nav-link' unless logged_in?
  end

  def navbar_link_login
    link_to 'Login |', login_path, class: 'nav-link' unless logged_in?
  end
end
