class User < ActiveRecord::Base
  
	 if Rails.env.development?
    	has_attached_file :cover_image, :styles => { :medium => "200x200", :thumb => "100x100>" }, :default_url => "default.jpg"
  	 else
		has_attached_file :cover_image, :styles => { :medium => "200x200", :thumb => "100x100>" }, :default_url => "default.jpg",
		:storage => :dropbox,
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:path => ":style/:id_:filename"
	 end

	validates_attachment_content_type :cover_image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :name, presence: true

   has_many :listings, dependent: :destroy
   has_many :sales, class_name: "Order", foreign_key: "seller_id"
   has_many :purchases, class_name: "Order", foreign_key: "buyer_id" 
   
end
