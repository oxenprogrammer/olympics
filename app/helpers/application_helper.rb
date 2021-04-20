module ApplicationHelper
  def navbar_link_name
    link_to current_user.name, user_url(current_user.id), class: 'nav-link' if logged_in?
  end

  def navbar_link_new_event
    link_to 'Add New Event', events_path, class: 'text-white btn btn-success' if logged_in?
  end

  def navbar_link_logout
    link_to 'Logout', logout_path, method: :delete, class: 'nav-link' if logged_in?
  end

  def navbar_link_sign_up
    link_to 'Sign Up', signup_path, class: 'nav-link' unless logged_in?
  end

  def navbar_link_login
    link_to 'Login', login_path, class: 'nav-link' unless logged_in?
  end

  def navbar_link_home
    if logged_in?
      link_to 'Private Events', events_all_url, class: 'navbar-brand'
    else
      link_to 'Private Events', root_url, class: 'navbar-brand'
    end
  end
end
