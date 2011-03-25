class Idea < AbstractIdea
  default_scope :order => 'position'
  
  accepts_nested_attributes_for :comments
  
  attr_accessible :comments_attributes
  
  acts_as_list
  
  def already_voted?(person)
    voters.include?(person)
  end
  
  def move_up
    reload
    item = self.class.where(['votes_count > ?',votes_count]).last
    insert_at(item.position-1)
  end
  
  def scrap
    update_attribute(:type,'ScrappedIdea')
  end
  
  def cycle
    update_attribute(:type,'CyclingIdea')
  end
end
