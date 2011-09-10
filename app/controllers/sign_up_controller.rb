class SignUpController < ApplicationController
  respond_to :html
  
  expose(:user)
  
  def create
    user.save
    respond_with user, :location => edit_confirmation_url(user.id)
  end
end