class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user = resource.class.name.underscore
    if resource.first_name.blank?
      flash[:notice] = 'Please complete your profile'
      eval "edit_#{user}_path current_#{user}"
    else
      eval "current_#{user}"
    end
  end
end
