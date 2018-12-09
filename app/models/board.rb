class Board < ApplicationRecord
  # model association
  has_many :squares, dependent: :destroy

  # validations
  validates :size, numericality: { only_integer: true }

  def self.build_board_from_array(board_values)
    board = Board.create!
    block_size = Math.sqrt(board.size)
    # Rails doesnt handle 2d array params, I convert to allow easier indexing
    sliced_board = board_values.each_slice(board.size).to_a
    sliced_board.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index|
        block = column_index / block_size + row_index - row_index % block_size
        Square.create!(
          value: square.to_i,
          row: row_index,
          column: column_index,
          block: block.to_i,
          board: board
        )
      end
    end
    board
  end

  # sym should be one of the following symbols [:row, :column, :block]
  def group_valid?(sym)
    grouped_syms = self.squares.group_by(&sym).values
    sum_truths = []
    grouped_syms.each do |group|
      sum_truths.push(group.map{|square| square.value}.sum == (0..self.size).sum)
    end

    sum_truths.all?
  end
end
