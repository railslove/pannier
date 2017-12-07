class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @users = User.all
  end

  def create
    @expense = current_user.expenses.create(expense_params)

    @expense.create_bills_with_current_user_as_creditor(params[:amount].to_i, params[:user_ids])

    flash[:secondary] = 'Expense created!'
    redirect_to @expense
  end

  def show
    @expense = Expense.find(params[:id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(:description)
  end
end
