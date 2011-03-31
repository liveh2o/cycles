class AbstractIdea < ActiveRecord::Base
  set_table_name :ideas

  belongs_to :app
  belongs_to :creator, :class_name => 'Person', :foreign_key => :created_by
  has_many :comments, :foreign_key => :idea_id, :dependent => :delete_all
  has_many :votes, :foreign_key => :idea_id, :dependent => :delete_all
  has_many :voters, :through => :votes, :source => :person

  attr_accessible :title, :escalated
  
  validates_presence_of :title

  def cycling?
    is_a?(CyclingIdea)
  end
  
  def escalateable?
    votable?
  end

  def implemented?
    is_a?(ImplementedIdea)
  end

  def scrappable?
    respond_to?(:scrap)
  end
  
  def scrapped?
    is_a?(ScrappedIdea)
  end

  def votable?
    respond_to?(:cycle)
  end
end
