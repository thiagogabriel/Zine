class Image < ActiveRecord::Base
  belongs_to :block

  has_attached_file :image,
  					:styles => {:full => "1170x320#", :gallery => "1170x320#", :medium => "600x450>", :thumb => "100x100>" },
				    :storage => :s3,
				    :bucket => "marcopompei-zine",
				    :s3_credentials => {
			          :access_key_id => ENV['S3_KEY'],
			          :secret_access_key => ENV['S3_SECRET']
			        }
end
