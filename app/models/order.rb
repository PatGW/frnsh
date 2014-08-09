class Order < ActiveRecord::Base
  validates :email, :name, :address, :city, :county, :post_code, :phone, presence: true

  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
end
