class BoardsController < ApplicationController
  def is_valid
    puts '=-=-=-=-=-=-=-=-=-='
    puts 'In is_valid_board'
    puts params["board"].inspect
    puts '=-=-=-=-=-=-=-=-=-='
    render json: { is_valid: check_board(params["board"]) }, status: :ok
  end
end

private

def check_board(board)
  # TODO: Implement checking of board
  false
end
