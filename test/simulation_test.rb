require 'minitest/autorun'
require 'mocha/minitest'
require './lib/cell'
require './lib/board'
require './lib/simulation'

class SimulationTest < MiniTest::Test

  def setup
    @simulation = Simulation.new
  end

  def test_instantiation
    assert_instance_of Simulation, @simulation
    assert_instance_of Board, @simulation.board
    assert_instance_of Cell, @simulation.board.cells.first.first
  end

  def test_it_can_target_center_cell
    assert_equal false, @simulation.board.cells[1][1].is_target?

    @simulation.target_center_cell

    assert_equal true, @simulation.board.cells[1][1].is_target?
  end

  def test_it_can_randomly_activate_board_cells
    assert_equal true, @simulation.board.cells.flatten.all? { |cell| cell.is_active? == false }

    @simulation.stubs(:rand).returns(1)
    @simulation.set_active_cells

    assert_equal false, @simulation.board.cells.flatten.all? { |cell| cell.is_active? == false }
  end

  def test_it_can_check_up
    @simulation.check_up

    assert_equal 0, @simulation.active_cells_near_target_count

    @simulation.board.cells[0][1].activate
    @simulation.check_up

    assert_equal 1, @simulation.active_cells_near_target_count
  end

  def test_it_can_check_down
    @simulation.check_down

    assert_equal 0, @simulation.active_cells_near_target_count

    @simulation.board.cells[2][1].activate
    @simulation.check_down

    assert_equal 1, @simulation.active_cells_near_target_count
  end

  def test_it_can_check_left
    @simulation.check_left

    assert_equal 0, @simulation.active_cells_near_target_count

    @simulation.board.cells[1][0].activate
    @simulation.check_left

    assert_equal 1, @simulation.active_cells_near_target_count
  end

  def test_it_can_check_right
    @simulation.check_right

    assert_equal 0, @simulation.active_cells_near_target_count

    @simulation.board.cells[1][2].activate
    @simulation.check_right

    assert_equal 1, @simulation.active_cells_near_target_count
  end

  def test_it_can_check_cell_horizontal_neighbors
    @simulation.stubs(:rand).returns(1)
    @simulation.set_active_cells
    @simulation.target_horizontal_check
    
    assert_equal 2, @simulation.active_cells_near_target_count

    simulation_2 = Simulation.new
    simulation_2.board.cells[1][0].activate
    simulation_2.target_horizontal_check

    assert_equal 1, simulation_2.active_cells_near_target_count
  end

  def test_it_can_check_cell_vertical_neighbors
    @simulation.stubs(:rand).returns(1)
    @simulation.set_active_cells
    @simulation.target_vertical_check
    
    assert_equal 2, @simulation.active_cells_near_target_count

    simulation_2 = Simulation.new
    simulation_2.board.cells[0][1].activate
    simulation_2.target_vertical_check

    assert_equal 1, simulation_2.active_cells_near_target_count
  end

  def test_it_can_check_diagonal_top_neighbors
    @simulation.stubs(:rand).returns(1)
    @simulation.set_active_cells
    @simulation.check_diagonal_top
    
    assert_equal 2, @simulation.active_cells_near_target_count

    simulation_2 = Simulation.new
    simulation_2.board.cells[0][2].activate
    simulation_2.check_diagonal_top

    assert_equal 1, simulation_2.active_cells_near_target_count
  end

  def test_it_can_check_diagonal_bottom_neighbors
    @simulation.stubs(:rand).returns(1)
    @simulation.set_active_cells
    @simulation.check_diagonal_bottom
    
    assert_equal 2, @simulation.active_cells_near_target_count

    simulation_2 = Simulation.new
    simulation_2.board.cells[2][2].activate
    simulation_2.check_diagonal_bottom

    assert_equal 1, simulation_2.active_cells_near_target_count
  end

  def test_it_can_check_cell_diagonal_neighbors
    @simulation.stubs(:rand).returns(1)
    @simulation.set_active_cells
    @simulation.target_diagonal_check
    
    assert_equal 4, @simulation.active_cells_near_target_count

    simulation_2 = Simulation.new
    simulation_2.board.cells[0][2].activate
    simulation_2.target_diagonal_check

    assert_equal 1, simulation_2.active_cells_near_target_count

    simulation_2.board.cells[2][2].activate
    simulation_2.target_diagonal_check

    simulation_3 = Simulation.new
    simulation_3.board.cells[0][2].activate
    simulation_3.board.cells[2][2].activate
    simulation_3.board.cells[0][0].activate
    simulation_3.target_diagonal_check

    assert_equal 3, simulation_3.active_cells_near_target_count
  end
end