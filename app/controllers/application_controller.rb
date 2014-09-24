class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :current_member
  
  def current_member
   if Member.exists?(:user_id => current_user.id)
  @current_member ||= Member.find_by_user_id!(current_user.id)
  else
    @current_member = nil
   end
 end

end
