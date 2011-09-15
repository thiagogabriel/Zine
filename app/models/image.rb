class Image < ActiveRecord::Base
  belongs_to :block

  has_attached_file :image#, :styles => { :medium => "600x450>", :thumb => "100x100>" }
end
