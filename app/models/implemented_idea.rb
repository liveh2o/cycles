class ImplementedIdea < CyclingIdea
  def upgrade
    raise "Can't upgrade an implemented idea"
  end
end
