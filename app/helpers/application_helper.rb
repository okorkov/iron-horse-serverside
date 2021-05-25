module ApplicationHelper

  def define_admin
    @admin = current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
   end
 
   def require_login
     redirect_to new_session_path if !current_user
   end
 
   def logged_in?
     session[:user_id] != nil
   end

   def info_store
    @info = Info.all.first
   end

end
