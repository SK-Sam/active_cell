require 'minitest/autorun'
require './lib/cell'

class CellTest < MiniTest::Test
  
  def setup
    @cell = Cell.new
  end

  def test_it_can_instantiate
    assert_instance_of Cell, @cell
  end
  
  def test_it_can_check_if_its_active_and_has_default_value
    assert_equal false, @cell.is_active?
  end
  
  def test_it_can_check_if_its_target_and_has_default_value
    assert_equal false, @cell.is_target?
  end

  def test_it_can_be_activated
    assert_equal false, @cell.is_active?

    @cell.activate
    
    assert_equal true, @cell.is_active?
  end

  def test_it_can_be_targeted
    @cell.target
    
    assert_equal true, @cell.is_target?
  end
end