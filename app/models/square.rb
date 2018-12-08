class Square < ApplicationRecord
  # Model association
  belongs_to :board

  # Validation
  validates :value, numericality: { only_integer: true }
  validates :row, numericality: { only_integer: true }
  validates :column, numericality: { only_integer: true }
  validates :block, numericality: { only_integer: true }
end
