class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: [:create ,:destroy]
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to expense_path(@expense.id)
    else
      render expense_path(@expense.id)
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to expense_path(@expense.id)
    else
      render expense_path(@expense.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, expense_id: params[:expense_id])
  end
  def set_expense
    @expense = Expense.find(params[:expense_id])
  end
end
