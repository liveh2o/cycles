class Comment < ActiveRecord::Base
  belongs_to :creator, :class_name => 'Person', :foreign_key => :created_by
  belongs_to :idea, :counter_cache => true
    
  attr_accessible :body

  validates_presence_of :body, :idea_id
end
