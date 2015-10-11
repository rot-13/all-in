class SessionsController < ApplicationController

  def create
    user = User.from_facebook(env['omniauth.auth'])
    sign_in(user)
    redirect_to session[:redirect_url] || root_url
  end

  def destroy
    sign_out()
    redirect_to root_url
  end

  def fail
    flash[:alert] = params[:message].presence || I18n.translate("errors.login-failed")
    redirect_to root_url
  end
end
