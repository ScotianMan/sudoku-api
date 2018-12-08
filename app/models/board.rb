class Board < ApplicationRecord
  # model association
  has_many :squares, dependent: :destroy

  # validations
  validates :size, numericality: { only_integer: true }
end
