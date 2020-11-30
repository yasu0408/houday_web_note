class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: :index
  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end
