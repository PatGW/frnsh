class Order < ActiveRecord::Base
  validates :email, :name, :address, :city, :county, :post_code, :phone, presence: true

  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  def self.calculate_shipping_cost(post_code)
    case post_code.split[0].upcase #splits the string based on spaces and returns first part, then convert it to upper case
      when "RH"
        20
      when "BN"
        20
      when "CA"
        45
      else
        nil
    end
  end
end
