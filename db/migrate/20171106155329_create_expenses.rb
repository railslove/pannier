class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :user_id, index: true
      t.string :description

      t.timestamps
    end
  end
end
