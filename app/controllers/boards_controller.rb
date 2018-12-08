class BoardsController < ApplicationController
  def is_valid
    render json: { is_valid: check_board(params["board"]) }, status: :ok
  end
end

private

def check_board(board_values)
  board = Board.build_board_from_array(board_values)
  false
end
