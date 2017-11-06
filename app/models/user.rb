class User < ApplicationRecord
  validates :username,  presence: true,
                        length: { maximum: 12 },
                        uniqueness: true

  validates :email,  presence: true,
                     length: { maximum: 50 },
                     uniqueness: true,
                     # format: { with: EMAIL_REGEX },
                     confirmation: true
end
