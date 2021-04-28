class Expense < ApplicationRecord
          validates :income, presence: true
          validates :outcome, presence: true

          def self.remaining_money
                    all.reduce(0) { |sum, obj| sum + obj.income } - all.reduce(0) { |sum, obj| sum + obj.outcome }
          end
end
