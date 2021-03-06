# Simulation acts as an all-knowing entity that is setting up and initializing
# the board. The Simulation class is interacting heavily with a board and cells
# because it knows the rules where a Board shouldn't carry that information
# The rules are simply just bounds of the Board being initialized, being
# highest, lowest, most left, and most right points. A simulation should
# be created everytime a User would like to run a new randomly generated
# "run" of this situation, being that there will be a target cell and
# active cells nearby it which can be detected through diagonal, horizontal,
# and vertical checks

class Simulation
  attr_reader :board,
              :active_cells_near_target_count

  def initialize(row = 1, column = 1)
    @board = Board.new
    @target_row = row
    @target_column = column
    @active_cells_near_target_count = 0
    @out_of_bounds_top = 0 
    @out_of_bounds_left = 0 
    @out_of_bounds_bottom = @board.cells.count - 1
    @out_of_bounds_right = @board.cells[row].count - 1
  end

  def target_center_cell
    @board.cells[@target_row][@target_column].target
  end

  def set_active_cells
    @board.cells.each do |cell_rows|
      cell_rows.each do |cell|
        cell.activate if rand(0..1) == 1
      end
    end
  end

  def check_all_target_neighbors
    @active_cells_near_target_count = 0
    target_horizontal_check
    target_vertical_check
    target_diagonal_check
    @active_cells_near_target_count
  end

  def target_horizontal_check
    check_left
    check_right
  end

  def target_vertical_check
    check_up
    check_down
  end

  def target_diagonal_check
    check_diagonal_top
    check_diagonal_bottom
  end

  def check_up
    if @target_row - 1 >= @out_of_bounds_top && @board.cells[@target_row - 1][@target_column].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_down
    if @target_row + 1 <= @out_of_bounds_bottom && @board.cells[@target_row + 1][@target_column].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_left
    if @target_column - 1 >= @out_of_bounds_left && @board.cells[@target_row][@target_column - 1].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_right
    if @target_column + 1 <= @out_of_bounds_right && @board.cells[@target_row][@target_column + 1].is_active?
      @active_cells_near_target_count += 1
    end
  end

  # Using guard clause to not even check the diagonal tops if out of bounds
  def check_diagonal_top
    return if @target_row - 1 < @out_of_bounds_top
    @active_cells_near_target_count += 1 if @board.cells[@target_row - 1][@target_column - 1] != nil && @board.cells[@target_row - 1][@target_column - 1].is_active?
    @active_cells_near_target_count += 1 if @board.cells[@target_row - 1][@target_column + 1] != nil && @board.cells[@target_row - 1][@target_column + 1].is_active?
  end

  def check_diagonal_bottom
    return if @target_row + 1 > @out_of_bounds_bottom
    @active_cells_near_target_count += 1 if @board.cells[@target_row + 1][@target_column - 1] != nil && @board.cells[@target_row + 1][@target_column - 1].is_active?
    @active_cells_near_target_count += 1 if @board.cells[@target_row + 1][@target_column + 1] != nil && @board.cells[@target_row + 1][@target_column + 1].is_active?
  end
end