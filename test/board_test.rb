require 'minitest/autorun'
require './lib/cell'
require './lib/board'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
  end

  def test_instantiation
    assert_instance_of Board, @board
    assert_instance_of Array, @board.cells
    assert_equal 3, @board.cells.count
    assert_equal 9, @board.cells.flatten.count
    assert_equal true, @board.cells.flatten.all? { |cell| cell.class == Cell }
  end

  def test_it_can_evaluate_all_cells_as_2d_array
    default_board_evaluated = [
      ['.', '.', '.'],
      ['.', '.', '.'],
      ['.', '.', '.']
    ]

    assert_equal default_board_evaluated, @board.all_cells_evaluated

    board_with_active_cell = [
      ['.', '!', '.'],
      ['.', '.', '.'],
      ['.', '.', '.']
    ]
    @board.cells[0][1].activate

    assert_equal board_with_active_cell, @board.all_cells_evaluated
  end

  def test_it_can_render_default_board
    board_layout =
    " 1 2 3\n" + 
    "A . . . \n" + 
    "B . . . \n" +
    "C . . . \n"
    #require 'pry'; binding.pry
    assert_equal board_layout, @board.render
  end
end