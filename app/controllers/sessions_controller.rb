class SessionsController < ApplicationController
  def create
    user = User.from_facebook(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to session[:redirect_url] || root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
