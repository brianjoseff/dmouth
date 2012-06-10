class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  before_filter :require_login
  
  private
#     def admin_user
#       if current_user.nil? || !current_user.admin?
#         redirect_to(root_path)
#       end
#     end
    
    def require_login
      unless signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to signin_path
      end
    end
end
