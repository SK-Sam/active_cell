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