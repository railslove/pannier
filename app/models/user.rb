class User < ApplicationRecord
  # validates :username,  presence: true,
  # length: { maximum: 12 },
  # uniqueness: true
  has_many :expenses
  has_many :user_expenses
  validates :email,  presence: true,
                     length: { maximum: 50 },
                     uniqueness: true,
                     confirmation: true
end
