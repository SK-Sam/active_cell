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