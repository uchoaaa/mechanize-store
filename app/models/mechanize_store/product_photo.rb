module MechanizeStore
  class ProductPhoto < ActiveRecord::Base
    belongs_to :product

    has_attached_file :file,
        :styles => { :medium => "300x300>", :thumb => "100x100>" },
        :default_url => "/images/:style/missing.png",
        path: "#{Rails.root}/public/photos/:id/:style.:extension",
        url: "/photos/:id/:style.:extension"#,
        # storage: :s3,
        # s3_credentials: "#{Rails.root}/config/amazon_s3.yml"

    # validates_attachment_content_type :file, :content_type => /png|jpg|jpeg/
    validates :file, :attachment_presence => true
  end
end
