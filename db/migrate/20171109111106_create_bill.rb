class CreateBill < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.integer :user_id
      t.integer :expense_id
      t.integer :amount

      t.timestamps

      # add_index :user_expenses, %w[expense_id user_id], unique: true
    end
  end
end
