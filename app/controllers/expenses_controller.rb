class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @users = User.where.not(id: current_user)
  end

  def create
    @expense = current_user.expenses.create(expense_params)

    @expense.create_bills

    flash[:secondary] = 'Expense created!'
    redirect_to @expense
  end

  def show
    @expense = Expense.find(params[:id])
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :amount, :include_current_user_in_bill, user_ids: [])
  end
end
