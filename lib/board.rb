# Each board will start with a 2d matrix of cells all 
# with default values.
# @cells = [
#  [cell, cell, cell],
#  [cell, cell, cell],
#  [cell, cell, cell]
# ]
class Board
  attr_reader :cells

  def initialize
    @cells = Array.new(3) { 
      Array.new(3) { Cell.new }
     }
  end

  # Render will use all_cells_evaluated to gather
  # all individual Cell Render values and interpolate
  # them into User friendly CLI board. 2d Array turned
  # into one string formatted with columns = numbers
  # and letters = rows
  # EX:  1 2 3
  #    A . . !
  #    B . T .
  #    C . ! .
  def render
    layout_number_string = " 1 2 3\n"
    board_results = ['A', 'B', 'C']

    all_cells_evaluated.each_with_index do |row, index|
      row.each do |cell_result|
        board_results[index] += " #{cell_result}"
      end
      board_results[index] += " \n"
    end

    layout_number_string + board_results.join('')
  end

  # Helper method for Render which changes all values 
  # of @cells to String evaluation of what each cell 
  # should represent
  # Ex: [
    # ['$', '.', '.'],
    # ['.', '.', '.'],
    # ['.', '.', '.']
  # ]
  def all_cells_evaluated
    @cells.map do |cell_row|
      cell_row.map do |cell| 
        cell.render
      end
    end
  end
end