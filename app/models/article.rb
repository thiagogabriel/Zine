class Article < ActiveRecord::Base
  has_many :blocks, :dependent => :destroy
  
  validates_length_of :title, :within => 3..50
end
