class ImplementedIdea < CyclingIdea
  def cycling?
    false
  end

  def implemented?
    true
  end
  
  def upgrade
    raise "Can't upgrade an implemented idea"
  end
end
