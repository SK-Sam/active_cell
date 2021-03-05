# Cell is only responsible for either being a target and/or active.
# In this project, there will be no reason to un-target or 
# de-activate cells. The simulation should be able to check/set if the
# cell is a target/active using getter/setter methods

class Cell

  def initialize
    @active = false
    @target = false
  end

  def is_active?
    @active
  end

  def is_target?
    @target
  end

  def activate
    @active = true
  end
end