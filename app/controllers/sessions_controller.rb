class SessionsController < ApplicationController
  respond_to :html
  
  expose(:user) { User.where(nickname: params[:nickname], password: params[:password]).first }
  
  def create
    unless user.nil?
      user.increment_sign_in_count
    else
      flash[:error] = "could not authorize"
    end
    
    respond_with user
  end
end