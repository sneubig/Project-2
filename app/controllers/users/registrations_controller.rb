class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:zipcode, :email, :password, :password_confirmation)
    end

  #   devise_parameter_sanitizer.for(:account_update).push(:zipcode, :email, :password, :password_confirmation)
  #   end
  # end

end