class Bill < ApplicationRecord
  belongs_to :expense
  has_many :users
end
