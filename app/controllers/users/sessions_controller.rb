
class Users::SessionsController < Devise::SessionsController
  before_action :check_blocked, only: :create

  private

  def check_blocked
    user = User.find_by(email: params[:user][:email])

    if user && user.blocked?
      redirect_to new_user_session_path, alert: 'Your account is blocked. Please contact to admin.'
    end
  end
end
