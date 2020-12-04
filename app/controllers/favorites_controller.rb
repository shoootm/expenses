class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.build(expense_id: params[:expense_id])
    favorite.save!
    redirect_to root_path, success: t('.flash.favorite')
  end
  def destroy
    current_user.favorites.find_by(expense_id: params[:expense_id]).destroy!
    redirect_to root_path, success: t('.flash.not_favorite')
  end
end
