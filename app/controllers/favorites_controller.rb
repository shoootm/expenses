class FavoritesController < ApplicationController
  before_action :set_expense
  before_action :authenticate_user!

  def create
    if @expense.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, expense_id: @expense.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, expense_id: @expense.id)
    @favorite.destroy
  end

  def show
    favorites = Favorite.where(user_id: current_user.id).pluck(:expense_id)
    @favorite_list = Favorite.find(favorites)
  end

  private
  def set_expense
    @expense = Post.find(params[:expense_id])
  end

end
