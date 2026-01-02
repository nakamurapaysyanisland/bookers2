class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])

    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
  
  private

  def after_sign_in_path_for(resource) #ログイン、サインイン後に表示されるパス
      user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path(resource)
  end
  

end
