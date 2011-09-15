class Block < ActiveRecord::Base
  belongs_to :article
  has_many :images
  
  validates_presence_of :article_id, :order, :data, :block_type
end
