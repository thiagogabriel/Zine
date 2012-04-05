class Article < ActiveRecord::Base
  has_many :blocks, :dependent => :destroy
  
  validates_length_of :title, :within => 3..50
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => [ /^image\/(?:jpeg|gif|png)$/, nil ]
  
  has_attached_file :image, :styles => {:gallery => "940x640>", :medium => "300x300#", :thumb => "100x100#" }
end
