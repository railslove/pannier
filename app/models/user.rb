class User < ApplicationRecord
  # validates :username,  presence: true,
  # length: { maximum: 12 },
  # uniqueness: true
  has_many :expenses
  has_many :bills
  validates :email,  presence: true,
                     length: { maximum: 50 },
                     uniqueness: true,
                     confirmation: true

  def except_current_user(user_id)
    where.not(id: user_id)
  end

  def total_value_from_bills
    bills.sum(:amount_cents)
  end
end
