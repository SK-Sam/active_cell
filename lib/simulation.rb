class Simulation
  attr_reader :board,
              :target_cell,
              :active_cell_near_target_count

  def initialize(target_cell = [1, 1])
    @board = Board.new
    @target_cell = { 
      row: target_cell.first,
      column: target_cell.last
    }
    @active_cell_near_target_count = 0
  end

  def target_center_cell
    @board.cells[@target_cell[:row]][@target_cell[:column]].target
  end

  def set_active_cells
    @board.cells.each do |cell_rows|
      cell_rows.each do |cell|
        cell.activate if rand(0..1) == 1
      end
    end
  end

  def target_horizontal_check
    @active_cell_near_target_count = 0
    row = @target_cell[:row]
    column = @target_cell[:column]
    out_of_bounds_left = 0
    out_of_bounds_right = @board.cells[row].count - 1 # should be 2 in a 3x3 2d array
    
    if column - 1 >= out_of_bounds_left && @board.cells[row][column - 1].is_active?
      @active_cell_near_target_count += 1
    end
    if column + 1 <= out_of_bounds_right && @board.cells[row][column + 1].is_active?
      @active_cell_near_target_count += 1
    end
  end

  def target_vertical_check
    @active_cell_near_target_count = 0
    row = @target_cell[:row]
    column = @target_cell[:column]
    out_of_bounds_top = 0
    out_of_bounds_bottom = @board.cells.count - 1 # should be 2 in a 3x3 2d array
    
    if row - 1 >= out_of_bounds_top && @board.cells[row - 1][column].is_active?
      @active_cell_near_target_count += 1
    end
    if row + 1 <= out_of_bounds_bottom && @board.cells[row + 1][column].is_active?
      @active_cell_near_target_count += 1
    end
  end

  def target_diagonal_check

  end
end