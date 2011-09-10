class ConfirmationsController < ApplicationController
  respond_to :html
  expose(:confirmation)
  
  def update
    confirmation.complete
    respond_with confirmation, :location => root_path  
  end
end