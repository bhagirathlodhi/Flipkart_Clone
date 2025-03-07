class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :set_query
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def set_query
  #   @query = Product.ransack(params[:q])
  # end

  protected

   

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
    end
  private

    def authenticate_admin!
      unless current_user&.admin?
        redirect_to root_path, alert: 'You are not authorized to perform this action.'
      end
    end
end









