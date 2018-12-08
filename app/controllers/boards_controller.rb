class BoardsController < ApplicationController
  def is_valid
    # TODO: add methods to determine if passed Sudoku is valid
    render json: { is_valid: false }, status: :ok
  end
end
