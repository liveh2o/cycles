class Vote < ActiveRecord::Base
  belongs_to :idea, :counter_cache => true
  belongs_to :person
  
  attr_accessible # No mass assignment...
  
  validates_uniqueness_of :idea_id, :scope => :person_id
  
  after_create :move_idea_up
  
  private
    def move_idea_up
      idea.move_up
    end
end
