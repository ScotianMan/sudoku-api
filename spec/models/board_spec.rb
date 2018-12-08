require 'rails_helper'

RSpec.describe Board, type: :model do
  # Association test
  # Ensure Board model has a 1:N relationship with the Square model
  it { should have_many(:squares).dependent(:destroy) }

  # Validation tests
  # Ensure columns are present before saving
  it { should validate_numericality_of(:size) }
end
