class AddMoneyRailsToBill < ActiveRecord::Migration[5.1]
  def change
    change_table :bills do |t|
      t.monetize :amount
    end
  end
end
