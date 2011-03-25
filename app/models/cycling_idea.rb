class CyclingIdea < AbstractIdea
  def implemented
    update_attribute(:type,'ImplementedIdea')
  end
end
