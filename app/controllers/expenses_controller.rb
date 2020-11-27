class ExpensesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @expenses = Expense.all
  end
  def new
    @expense = Expense.new
  end
  def create
    @expense = Expense.new(expense_params)
    @expense.save
    redirect_to action: :index
  end
  def edit
    @expense = Expense.find(params[:id])
  end
  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    redirect_to action: :index
  end
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to action: :index
  end
  private
  def expense_params
    params.require(:expense).permit(:income, :food_expense, :necessities, :clothes_expense, :beauty_expense, :entertainment_expense, :medical_bill, :education_cost, :utility_costs, :traveling_expense, :other, :memo).merge(user_id: current_user.id)
  end
end
