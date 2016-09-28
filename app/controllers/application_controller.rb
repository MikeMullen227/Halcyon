class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	'/admins'
  end



 protected


  def redirect_if_not_admin
    if current_user == nil || current_user.role != "admin"
      flash[:message] = "You don't have permission to see this page."
      redirect_to "/"
    end
  end


end


