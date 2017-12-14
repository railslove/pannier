class Expense < ApplicationRecord
  belongs_to :user
  has_many :bills

  attr_accessor :amount
  attr_accessor :user_ids
  attr_accessor :include_current_user_in_bill

  def create_bills
    amount_in_money = Money.new(amount.tr(',', '.').to_f * 100.to_i, 'EUR')
    create_bills_split(amount_in_money)
  end

  def create_bills_split(amount)
    if include_current_user_in_bill == '1'
      create_bills_split_with_current_user(amount)
    else
      create_bills_split_without_current_user(amount)
    end
  end

  def create_bills_split_with_current_user(amount)
    splitted_amount = amount.split(user_ids.count + 1)
    create_bill(user_id, amount - splitted_amount.pop)
    user_ids.each do |user_id|
      create_bill(user_id, -splitted_amount.pop)
    end
  end

  def create_bills_split_without_current_user(amount)
    splitted_amount = amount.split(user_ids.count)
    create_bill(user_id, amount)
    user_ids.each do |user_id|
      create_bill(user_id, -splitted_amount.pop)
    end
  end

  def create_bill(user_id, amount)
    bills.create(user_id: user_id, amount: amount)
  end
end
