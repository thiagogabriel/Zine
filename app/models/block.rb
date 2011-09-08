class Block < ActiveRecord::Base
  belongs_to :article
  
  validates_presence_of :article_id, :order, :data, :type
end
