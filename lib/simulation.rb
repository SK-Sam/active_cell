class Simulation
  attr_reader :board,
              :target_cell,
              :active_cells_near_target_count

  def initialize(target_cell = [1, 1])
    @board = Board.new
    @target_cell = { 
      row: target_cell.first,
      column: target_cell.last
    }
    @active_cells_near_target_count = 0
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
    check_left
    check_right
  end

  def target_vertical_check
    @active_cell_near_target_count = 0
    check_up
    check_down
  end

  def target_diagonal_check
    check_diagonal_top
    check_diagonal_bottom
  end

  def check_up
    row = @target_cell[:row]
    column = @target_cell[:column]
    out_of_bounds_top = 0

    if row - 1 >= out_of_bounds_top && @board.cells[row - 1][column].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_down
    row = @target_cell[:row]
    column = @target_cell[:column]
    out_of_bounds_bottom = @board.cells.count - 1

    if row + 1 <= out_of_bounds_bottom && @board.cells[row + 1][column].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_left
    row = @target_cell[:row]
    column = @target_cell[:column]
    out_of_bounds_left = 0

    if column - 1 >= out_of_bounds_left && @board.cells[row][column - 1].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_right
    row = @target_cell[:row]
    column = @target_cell[:column]
    out_of_bounds_right = @board.cells[row].count - 1

    if column + 1 <= out_of_bounds_right && @board.cells[row][column + 1].is_active?
      @active_cells_near_target_count += 1
    end
  end

  # Using guard clause to not even check the diagonal tops if out of bounds
  def check_diagonal_top
    row = @target_cell[:row]
    column = @target_cell[:column]
    out_of_bounds_top = 0

    return if row - 1 < out_of_bounds_top
    @active_cells_near_target_count += 1 if @board.cells[row - 1][column - 1] != nil && @board.cells[row - 1][column - 1].is_active?
    @active_cells_near_target_count += 1 if @board.cells[row - 1][column + 1] != nil && @board.cells[row - 1][column + 1].is_active?
  end

  def check_diagonal_bottom
    row = @target_cell[:row]
    column = @target_cell[:column]
    out_of_bounds_bottom = @board.cells.count - 1

    return if row + 1 > out_of_bounds_bottom
    @active_cells_near_target_count += 1 if @board.cells[row + 1][column - 1] != nil && @board.cells[row + 1][column - 1].is_active?
    @active_cells_near_target_count += 1 if @board.cells[row + 1][column + 1] != nil && @board.cells[row + 1][column + 1].is_active?
  end
end