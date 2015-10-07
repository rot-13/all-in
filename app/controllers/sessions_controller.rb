class SessionsController < ApplicationController
  def create
    user = User.facebook(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
  end
end
