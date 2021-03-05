require 'minitest/autorun'
require './lib/cell'

class CellTest < MiniTest::Test
  
  def setup
    @cell = Cell.new
  end

  def test_it_can_instantiate_and_have_default_values
    assert_instance_of Cell, @cell
    assert false, @cell.target
  end

  def test_it_can_check_if_its_active
    assert false, @cell.is_active?
  end

  def test_it_can_be_activated
    assert false, @cell.is_active?

    @cell.activate
    
    assert true, @cell.is_active?
  end
end