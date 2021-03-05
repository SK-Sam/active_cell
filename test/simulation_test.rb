require 'minitest/autorun'
require 'minitest/unit'
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
    
    # center_coordinate will be created as [1][1] by default due to 3x3 grid
    center_coordinates = { row : 1, column: 1 }
    assert_equal center_coordinates, @simulation.target_cell
  end

  def test_it_can_target_center_cell
    assert_equal false, @simulation.board[1][1].is_target?

    @simulation.target_center_cell

    assert_equal true, @simulation.board[1][1].is_target?
  end

  def test_it_can_randomly_activate_board_cells
    assert_equal true, @board.cells.flatten.all? { |cell| cell.is_active? == false }

    Simulation.stubs(:rand).returns(1)
    @simulation.set_simulation

    assert_equal false, @board.cells.flatten.all? { |cell| cell.is_active? == false }
  end
end