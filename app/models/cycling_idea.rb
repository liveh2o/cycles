class CyclingIdea < Idea

  def upgrade
    update_attribute(:type,'ImplementedIdea')
  end
end
