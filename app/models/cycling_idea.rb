class CyclingIdea < Idea
  def cycling?
    true
  end

  def upgrade
    update_attribute(:type,'ImplementedIdea')
  end
end
