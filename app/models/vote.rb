class Vote < ActiveRecord::Base
  belongs_to :idea, :counter_cache => true
  belongs_to :person
  
  attr_accessible # No mass assignment...
  
  validates_uniqueness_of :idea_id, :scope => :person_id
end
