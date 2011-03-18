class Person < ActiveRecord::Base
  has_many :comments, :foreign_key => :created_by, :dependent => :nullify
  has_many :ideas, :foreign_key => :created_by, :dependent => :nullify
  has_many :votes, :dependent => :destroy
  
  attr_accessible :name, :email
end
