class Idea < ActiveRecord::Base
  belongs_to :app
  belongs_to :creator, :class_name => 'Person', :foreign_key => :created_by
  has_many :comments, :dependent => :delete_all
  has_many :votes, :dependent => :delete_all
  has_many :voters, :through => :votes, :source => :person
  
  accepts_nested_attributes_for :comments
    
  attr_accessible :app_id, :title, :comments_attributes
  
  validates_presence_of :app_id, :title
  
  def already_voted?(person)
    voters.include?(person)
  end
  
  def upgrade
    update_attribute(:type,'CyclingIdea')
  end
end
