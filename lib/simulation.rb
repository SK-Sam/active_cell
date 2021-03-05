class Simulation
  attr_reader :board,
              :active_cells_near_target_count

  def initialize(row = 1, column = 1)
    @board = Board.new
    # @target_cell = { 
    #   row: target_cell.first,
    #   column: target_cell.last
    # }
    @target_row = row
    @target_column = column
    @active_cells_near_target_count = 0
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
    out_of_bounds_top = 0

    if @target_row - 1 >= out_of_bounds_top && @board.cells[@target_row - 1][@target_column].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_down
    out_of_bounds_bottom = @board.cells.count - 1

    if @target_row + 1 <= out_of_bounds_bottom && @board.cells[@target_row + 1][@target_column].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_left
    out_of_bounds_left = 0

    if @target_column - 1 >= out_of_bounds_left && @board.cells[@target_row][@target_column - 1].is_active?
      @active_cells_near_target_count += 1
    end
  end

  def check_right
    out_of_bounds_right = @board.cells[@target_row].count - 1

    if @target_column + 1 <= out_of_bounds_right && @board.cells[@target_row][@target_column + 1].is_active?
      @active_cells_near_target_count += 1
    end
  end

  # Using guard clause to not even check the diagonal tops if out of bounds
  def check_diagonal_top
    out_of_bounds_top = 0

    return if @target_row - 1 < out_of_bounds_top
    @active_cells_near_target_count += 1 if @board.cells[@target_row - 1][@target_column - 1] != nil && @board.cells[@target_row - 1][@target_column - 1].is_active?
    @active_cells_near_target_count += 1 if @board.cells[@target_row - 1][@target_column + 1] != nil && @board.cells[@target_row - 1][@target_column + 1].is_active?
  end

  def check_diagonal_bottom
    out_of_bounds_bottom = @board.cells.count - 1

    return if @target_row + 1 > out_of_bounds_bottom
    @active_cells_near_target_count += 1 if @board.cells[@target_row + 1][@target_column - 1] != nil && @board.cells[@target_row + 1][@target_column - 1].is_active?
    @active_cells_near_target_count += 1 if @board.cells[@target_row + 1][@target_column + 1] != nil && @board.cells[@target_row + 1][@target_column + 1].is_active?
  end
end