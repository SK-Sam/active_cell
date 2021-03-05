require './lib/cell'

class CellTest < MiniTest::Test
  
  def setup
    @cell = Cell.new
  end

  def test_it_can_instantiate_and_have_default_values
    assert_instance_of Cell, @cell
    assert false, @cell.active
  end
end