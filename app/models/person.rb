class Person < ActiveRecord::Base
  has_many :comments, :foreign_key => :created_by, :dependent => :nullify
  has_many :edited_comments, :class_name => 'Comment', :foreign_key => :updated_by, :dependent => :nullify
  has_many :edited_ideas, :class_name => 'AbstractIdea', :foreign_key => :updated_by, :dependent => :nullify
  has_many :ideas, :foreign_key => :created_by, :dependent => :nullify
  has_many :votes, :dependent => :destroy
  
  attr_accessible :name, :email
end
