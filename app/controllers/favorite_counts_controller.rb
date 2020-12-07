class FavoriteCountsController < ApplicationController
  def count
    favorite_count = FavoriteCount.find_by(expense_id: params[:expense_id])
    if favorite_count.present?
      favorite_count.update(expense_id: params[:expense_id],count: params[:count])
    else
      FavoriteCount.create(expense_id: params[:expense_id],count: params[:count])
    end
  end
end
