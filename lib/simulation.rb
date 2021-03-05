class Simulation
  attr_reader :board,
              :target_cell

  def initialize(target_cell = [1, 1])
    @board = Board.new
    @target_cell = { 
      row: target_cell[0],
      column: target_cell[1] 
    }
  end
end