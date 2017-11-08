class CreateUserExpensesJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :user_expenses do |t|
      t.integer :expense_id
      t.integer :user_id
    end
    add_index('user_expenses', %w[expense_id user_id])
  end
end
