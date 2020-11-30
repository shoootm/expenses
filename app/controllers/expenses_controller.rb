class ExpensesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_expense, only: [:edit, :update, :destroy, :show]
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @expense.comments.includes(:user)
  end

  def edit
    redirect_to action: :index if current_user.id != @expense.user_id
  end

  def update
    if @expense.update(expense_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @expense.user_id
      @expense.destroy
      redirect_to action: :index
    else
      redirect_to root_path
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:income, :food_expense, :necessities, :clothes_expense, :beauty_expense, :entertainment_expense, :medical_bill, :education_cost, :utility_costs, :traveling_expense, :other, :memo).merge(user_id: current_user.id)
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
