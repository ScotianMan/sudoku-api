class Square < ApplicationRecord
  # Model association
  belongs_to :board

  # Validation
  validates :value, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :row, numericality: { only_integer: true }
  validates :column, numericality: { only_integer: true }
  validates :block, numericality: { only_integer: true }
end
