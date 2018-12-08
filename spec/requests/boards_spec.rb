require 'rails_helper'

RSpec.describe 'Sudoku API', type: :request do
  # Test Board
  let!(:default_board) { FactoryBot.create(:board) }
  good_values = [
    [ 4, 6, 7, 9, 2, 1, 3, 5, 8 ],
    [ 8, 9, 5, 4, 7, 3, 2, 6, 1 ],
    [ 2, 3, 1, 8, 6, 5, 7, 4, 9 ],
    [ 5, 1, 3, 6, 9, 8, 4, 2, 7 ],
    [ 9, 2, 8, 7, 5, 4, 6, 1, 3 ],
    [ 7, 4, 6, 1, 3, 2, 9, 8, 5 ],
    [ 3, 5, 4, 2, 8, 7, 1, 9, 6 ],
    [ 1, 8, 9, 3, 4, 6, 5, 7, 2 ],
    [ 6, 7, 2, 5, 1, 9, 8, 3, 4 ]
  ]
  
  bad_values = [
    [ 4, 6, 7, 9, 2, 1, 3, 5, 8 ],
    [ 8, 9, 5, 4, 7, 3, 2, 6, 1 ],
    [ 2, 3, 1, 8, 6, 5, 7, 4, 9 ],
    [ 5, 1, 3, 6, 9, 8, 4, 2, 7 ],
    [ 9, 2, 8, 7, 1, 4, 6, 1, 3 ],
    [ 7, 4, 6, 1, 3, 2, 9, 8, 5 ],
    [ 3, 5, 4, 2, 8, 7, 1, 9, 6 ],
    [ 1, 8, 9, 3, 4, 6, 5, 7, 2 ],
    [ 6, 7, 2, 5, 1, 9, 8, 3, 4 ]
  ]
  # good_values.each_with_index do |row_array, row_index|
  #   row_array.each_with_index do |value, column_index|
  #     Square.create(
  #       board: default_board,
  #       value: value,
  #       row: row_index,
  #       column: column_index,
  #       block: ((row_index / 3) * 3) + (column_index / 3)
  #     )
  #   end
  # end


  # Tests for a valid board
  describe 'POST /is_valid' do
    let(:good_board_attributes) { { board: good_values } }
    let(:bad_board_attributes) { { board: bad_values } }

    context 'when the request is valid' do

      it 'returns is_valid true when board is valid' do
        post '/is_valid', params: good_board_attributes
        expect(JSON.parse(response.body)["is_valid"]).to be true   
      end

      it 'returns is_valid false when board is not valid' do
        post '/is_valid', params: bad_board_attributes
        expect(JSON.parse(response.body)["is_valid"]).to be false   
      end

      it 'returns status code 200' do
        post '/is_valid', params: good_board_attributes
        expect(response).to have_http_status(200)
      end
    end
  end
end