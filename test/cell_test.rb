require 'minitest/autorun'
require './lib/cell'

class CellTest < MiniTest::Test
  
  def setup
    @cell = Cell.new
  end

  def test_it_can_instantiate_and_have_default_values
    assert_instance_of Cell, @cell
    assert_equal false, @cell.target
  end

  def test_it_can_check_if_its_active
    assert_equal false, @cell.is_active?
  end

  def test_it_can_be_activated
    assert_equal false, @cell.is_active?

    @cell.activate
    
    assert_equal true, @cell.is_active?
  end
end