class App < ActiveRecord::Base
  has_many :ideas, :dependent => :destroy
  
  attr_accessible :name
  
  validates_presence_of :name
end
