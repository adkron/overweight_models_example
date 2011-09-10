class ConfirmationsController < ApplicationController
  respond_to :html
  expose(:user)
  
  def update
    user.save
    respond_with user, :location => root_path  
  end
end