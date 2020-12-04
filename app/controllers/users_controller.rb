class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @expenses = @user.expenses
    @favorites = Favorite.where(checked: true)

    #@Favorite = @user.expenses.checked
    #favorites = Favorite.where(user_id: current_user.id).pluck(:expense_id)
    #@favorite_list = Post.find(favorites)
  end
end
