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
    assert false, @cell.active?
  end

  def test_it_can_be_activated
    assert false, @cell.active?

    @cell.activate
    
    assert true, @cell.active?
  end

  def test_it_can_be_chosen_as_cell_that_will_check_values_near_it
    assert false, @cell.target

    @cell.choose

    assert true, @cell.target
  end
end