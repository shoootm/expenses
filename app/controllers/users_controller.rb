class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    if user_signed_in? || current_user.id == params[:user_id]
      @expenses = current_user.expenses
    else
      render root_path
    end
  end
end
