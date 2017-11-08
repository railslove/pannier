class UserExpense < ApplicationRecord
  belongs_to :expense
  has_one :user
end
