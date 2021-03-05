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
  end
end