class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def facebook_login
    @facebook = FacebookService.new({ email: params[:email], password: params[:password] })
    @facebook.login
  end
end
