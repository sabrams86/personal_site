class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate_admin
    unless current_user.try(:admin?)
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to '/'
    end
  end
end
