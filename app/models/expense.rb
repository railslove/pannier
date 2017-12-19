class Expense < ApplicationRecord
  belongs_to :user
  has_many :bills

  def amount=(value)
    @amount = value.tr(',', '.').to_f * 100.to_i
  end

  def amount
    Money.new(@amount, 'EUR')
  end

  attr_accessor :user_ids
  attr_accessor :include_current_user_in_bill

  def create_bills
    if include_current_user_in_bill == '1'
      create_bills_split_with_current_user
    else
      create_bills_split_without_current_user
    end
  end

  def create_bills_split_with_current_user
    splitted_amount = amount.split(user_ids.count + 1)
    create_bill(user_id, amount - splitted_amount.pop)
    user_ids.each do |user_id|
      create_bill(user_id, -splitted_amount.pop)
    end
  end

  def create_bills_split_without_current_user
    splitted_amount = amount.split(user_ids.count)
    create_bill(user_id, amount)
    user_ids.each do |user_id|
      create_bill(user_id, -splitted_amount.pop)
    end
  end

  def create_bill(user_id, bill_amount)
    bills.create(user_id: user_id, amount: bill_amount)
  end
end
