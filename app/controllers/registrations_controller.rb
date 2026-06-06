class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :current_password, :medical_flags, :accessibility_level)
  end

  def after_sign_up_path_for(_resource)
    dashboard_path
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
end
