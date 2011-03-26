class Person < ActiveRecord::Base
  has_many :comments, :foreign_key => :created_by, :dependent => :nullify
  has_many :edited_comments, :class_name => 'Comment', :foreign_key => :updated_by, :dependent => :nullify
  has_many :abstract_ideas, :foreign_key => :created_by, :dependent => :nullify
  has_many :cycling_ideas, :foreign_key => :created_by, :dependent => :nullify
  has_many :edited_ideas, :class_name => 'AbstractIdea', :foreign_key => :updated_by, :dependent => :nullify
  has_many :ideas, :foreign_key => :created_by, :dependent => :nullify
  has_many :implemented_ideas, :foreign_key => :created_by, :dependent => :nullify
  has_many :scrapped_ideas, :foreign_key => :created_by, :dependent => :nullify
  has_many :votes, :dependent => :destroy
  
  attr_accessible :name, :email
end
