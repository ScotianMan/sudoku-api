require 'rails_helper'

RSpec.describe Board, type: :model do
  # Association test
  # Ensure Board model has a 1:N relationship with the Square model
  it { should have_many(:squares).dependent(:destroy) }

  # Validation tests
  # Ensure columns are present before saving
  it { should validate_numericality_of(:size) }

  describe '#build_board_from_array' do
    let(:good_board_attributes) { valid_solved_correct_board }

    context 'when the board passed has valid values' do

      it 'creates the board' do
        expect(Board.all.count).to eq 0
        created_board = Board.build_board_from_array(good_board_attributes)
        saved_board = Board.first
        expect(created_board).to eql(saved_board)    
      end

    end
  end
end
