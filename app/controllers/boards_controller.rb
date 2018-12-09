class BoardsController < ApplicationController
  def is_valid
    render json: { 
        is_valid: check_board(Board.build_board_from_array(params["board"])) 
      },
      status: :ok
  end
end

private

def check_board(board)
  [ board.group_valid?(:row), board.group_valid?(:column), board.group_valid?(:block) ].all?
end
