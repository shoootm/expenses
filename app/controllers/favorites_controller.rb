class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def checked
    expense = Favorite.find_by(expense_id: params[:expense_id],user_id: current_user.id)
    if expense.present?
      if expense.checked
        expense.update(checked: false)
      else
        expense.update(checked: true)
      end
    else
      Favorite.create(expense_id: params[:expense_id],checked: true, user_id: current_user.id)
    end

    item = Favorite.find_by(expense_id: params[:expense_id],user_id: current_user.id)
    count = Favorite.where(expense_id: params[:expense_id],checked: true).length
    render json: { expense: item, count: count }
  end
  def index
    @favorites = Favorite.where(user_id: current_user.id, checked: true)
  end

end
