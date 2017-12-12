class Expense < ApplicationRecord
  belongs_to :user
  has_many :bills

  def create_bills_with_current_user_as_creditor(amount, user_ids)
    splitted_amount = amount.split(user_ids.count + 1)
    bills.create(user_id: user_id, amount: amount - splitted_amount.pop)
    user_ids.each do |user_id|
      bills.create(user_id: user_id, amount: -splitted_amount.pop)
    end
  end
end
