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
    let(:invalid_board_attributes) { invalid_solved_incorrect_board }

    context 'when called with invalid argument' do
      
      it 'raises ArgumentError when an array is not passed' do 
        expect {
          Board.build_board_from_array("Definitely not an array :-P")
        }.to raise_error(ArgumentError)
      end

      it 'raises ArgumentError when an array is not of proper size/format' do 
        expect {
          Board.build_board_from_array([[1,2,3,4,5]])
        }.to raise_error(ArgumentError)
      end
    end

    context 'when the board passed has valid values' do

      it 'creates the board' do
        expect(Board.all.count).to eq 0
        created_board = Board.build_board_from_array(good_board_attributes)
        saved_board = Board.first
        expect(created_board).to eql(saved_board)
        board_values = saved_board.squares.map{|s| s.value}
        expect(board_values).to eql(good_board_attributes)
      end

    end

    context 'when the board passed has invalid values' do

      it 'raises invalid record' do
        expect { 
          Board.build_board_from_array(invalid_board_attributes)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end

    end
  end

  describe '#group_valid?' do
    # FactoryBot is installed and this should be refactored after FactoryBot can build boards
    let(:good_board) { Board.build_board_from_array(valid_solved_correct_board) }
    let(:bad_board) { Board.build_board_from_array(valid_solved_incorrect_board) }
    let(:dupe_board) { Board.build_board_from_array(valid_solved_dupe_board) }

    context 'when called with invalid symbol' do
      
      it 'raises ArgumentError' do 
        expect {
          good_board.group_valid?(:created_at)
        }.to raise_error(ArgumentError)
      end

    end

    context 'when called with :row, :column or :block' do

      # True tests
      # sums
      it 'returns true if rows have valid sums' do
        expect(good_board.group_valid?(:row)).to be true
      end

      it 'returns true if columns have valid sums' do
        expect(good_board.group_valid?(:column)).to be true
      end

      it 'returns true if blocks have valid sums' do
        expect(good_board.group_valid?(:block)).to be true        
      end

      # False tests
      # sums 
      it 'returns false if rows have invalid sums' do
        expect(bad_board.group_valid?(:row)).to be false
      end

      it 'returns false if columns have invalid sums' do
        expect(bad_board.group_valid?(:column)).to be false
      end

      it 'returns false if blocks have invalid sums' do
        expect(bad_board.group_valid?(:block)).to be false        
      end

      # dupes
      it 'returns false if rows have no dupes' do
        expect(dupe_board.group_valid?(:row)).to be false
      end

      it 'returns false if columns have no dupes' do
        expect(dupe_board.group_valid?(:column)).to be false
      end

      it 'returns false if blocks have no dupes' do
        expect(dupe_board.group_valid?(:block)).to be false        
      end
    end
  end
end
