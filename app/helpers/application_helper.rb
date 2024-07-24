module ApplicationHelper
  def flash_class(level)
    case level
    when :success then 'alert alert-success'
    when :notice then "alert alert-info"
    when :alert then "alert alert-danger"
    else "alert alert-warning"
    end
  end

  def check_admin_role
    unless current_user.admin?
      redirect_to root_path, alert: 'You do not have permission'
    end
  end

end



