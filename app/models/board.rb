class Board < ApplicationRecord
  # model association
  has_many :squares, dependent: :destroy

  # validations
  # until further features added the size of the board is fixed to 9 although
  # any perfect square could be used
  validates :size, numericality: { only_integer: true, equal_to: 9 }

  # class methods

  def self.build_board_from_array(board_values)
    board = Board.create!
    unless board_values.is_a?(Array) && board_values.count == (board.size ** 2)
      raise ArgumentError.new("board_values must be an Int [1-9] array and #{board.size ** 2} in length")
    end
    block_size = Math.sqrt(board.size)
    # Rails doesnt handle 2d array params, I convert to allow clearer indexing
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

  # instance methods
  
  # sym should be one of the following symbols of a Square [:row, :column, :block]
  def group_valid?(sym)
    unless [ :row, :column, :block].include?(sym)
      raise ArgumentError.new("group_valid can only be called :row, :column or :block")
    end
    grouped_syms = self.squares.group_by(&sym).values
    sum_truths = []
    grouped_syms.each do |group|
      values = group.map{|square| square.value}
      good_sum = values.sum == (0..self.size).sum
      no_dupes = values.uniq == values
      sum_truths.push(good_sum && no_dupes)
    end

    sum_truths.all?
  end
end
