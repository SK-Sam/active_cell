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
end