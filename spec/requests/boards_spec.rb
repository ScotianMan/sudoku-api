require 'rails_helper'

RSpec.describe 'Sudoku API', type: :request do
  # Test Board
  let!(:default_board) { FactoryBot.create(:board) }

  # Tests for a valid board
  describe 'POST /is_valid' do
    let(:good_board_attributes) { { board: valid_solved_correct_board } }
    let(:bad_board_attributes) { { board: valid_solved_incorrect_board } }

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

    context 'when the request is NOT valid' do
      before { post '/is_valid', params: { board: invalid_solved_incorrect_board } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Value must be greater than 0/)
      end
    end
  end
end