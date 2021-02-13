class Coupon < ApplicationRecord
  validates :name, presence: true, length: { is: 16}
end
