class Expense < ApplicationRecord
  belongs_to :user
  has_many :user_expenses
end
