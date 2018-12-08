require 'rails_helper'

RSpec.describe Square, type: :model do
  # Association test
  # Ensure a Square belongs to a single Board
  it { should belong_to(:board) }

  # Validation test
  # Ensure columns are present and valid ints before saving
  it { should validate_numericality_of(:value) }
  it { should validate_numericality_of(:row) }
  it { should validate_numericality_of(:column) }
  it { should validate_numericality_of(:block) }
end
