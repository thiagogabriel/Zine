class Article < ActiveRecord::Base
  has_many :blocks, :dependent => :destroy
  
  validates_length_of :title, :within => 3..50
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => [ /^image\/(?:jpeg|gif|png)$/, nil ]
  
  has_attached_file :image,
    :styles => {:full => "1170x320>", :gallery => "1170x320#", :medium => "600x450>", :thumb => "100x100>" },
    :storage => :s3,
    :bucket => "marcopompei-zine",
    :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      }
end
