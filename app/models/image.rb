class Image < ActiveRecord::Base
  belongs_to :block

  has_attached_file :image, :styles => {:full => "1170x320#", :gallery => "1170x320#", :medium => "600x450>", :thumb => "100x100>" }
end
