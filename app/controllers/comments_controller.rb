class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @expense = Expense.find(params[:expense_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to expense_path(@expense.id)
    else
      render expense_path(@expense.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, expense_id: params[:expense_id])
  end
end
