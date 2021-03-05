class Simulation
  attr_reader :board,
              :target_cell

  def initialize(target_cell = [1, 1])
    @board = Board.new
    @target_cell = { 
      row: target_cell.first,
      column: target_cell.last
    }
  end

  def target_center_cell
    @board.cells[@target_cell[:row]][@target_cell[:column]].target
  end
end