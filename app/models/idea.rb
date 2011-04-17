class Idea < AbstractIdea
  include RankedModel

  accepts_nested_attributes_for :comments
  
  attr_accessible :comments_attributes
  
  scope :escalated, where(:escalated => true)
  scope :normal, where(:escalated => false)

  ranks :priority
  
  def already_voted?(person)
    voters.include?(person)
  end
  
  def move_up
    reload
    item = self.class.where(['votes_count > ?',votes_count]).last
    update_attribute(:priority,item.priority+1)
  end
  
  def scrap
    update_attribute(:type,'ScrappedIdea')
  end
  
  def cycle
    update_attribute(:type,'CyclingIdea')
  end
end
