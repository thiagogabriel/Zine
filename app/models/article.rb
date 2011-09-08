class Article < ActiveRecord::Base
  has_many :blocks
  
  validates_length_of :title, :within => 3..50
end
