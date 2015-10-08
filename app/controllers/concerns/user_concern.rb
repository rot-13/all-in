module UserConcern
  extend ControllerSupport::Base

  helper_method :current_user, :user_signed_in?, :sign_in_path

  def current_user
    @_user ||= User.find(session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out()
    session[:user_id] = nil
  end

  def must_be_signed_in
    redirect_to sign_up_path unless user_signed_in?
  end

  def sign_in_path
    "/auth/facebook"
  end


end