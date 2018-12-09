require 'rails_helper'

RSpec.describe Board, type: :model do
  # Association test
  # Ensure Board model has a 1:N relationship with the Square model
  it { should have_many(:squares).dependent(:destroy) }

  # Validation tests
  # Ensure columns are present before saving
  it { should validate_numericality_of(:size) }

  describe '#build_board_from_array' do
    let(:good_board_attributes) { { board: good_values } }

    context 'when the request is valid' do

      it 'creates the board' do
      end

    end
  end
end
