class Idea < ActiveRecord::Base
  default_scope :order => 'position'
  
  belongs_to :app
  belongs_to :creator, :class_name => 'Person', :foreign_key => :created_by
  has_many :comments, :dependent => :delete_all
  has_many :votes, :dependent => :delete_all
  has_many :voters, :through => :votes, :source => :person
  
  accepts_nested_attributes_for :comments
    
  attr_accessible :app_id, :title, :comments_attributes
  
  validates_presence_of :app_id, :title
  
  acts_as_list
  
  def already_voted?(person)
    voters.include?(person)
  end

  def move_up
    reload
    item = self.class.where(['votes_count > ?',votes_count]).last
    insert_at(item.position-1)
  end
  
  def upgrade
    update_attribute(:type,'CyclingIdea')
  end
end
