class SignUpsController < ApplicationController
  respond_to :html
  
  expose(:sign_up)
  
  def create
    sign_up.complete
    respond_with sign_up, :location => edit_confirmation_url(sign_up.id)
  end
end