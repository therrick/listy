module ApplicationHelper
  
  def user_link
    if user_signed_in?
      link = []
      link << current_user.email
      link << '&nbsp;-&nbsp;'
      link << link_to('profile', edit_user_path(current_user.id))
      link << '&nbsp;-&nbsp;'
      link << link_to('sign out', destroy_user_session_path)
      link.join.html_safe
    end
  end
  
end
