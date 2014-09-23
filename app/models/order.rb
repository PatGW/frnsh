class Order < ActiveRecord::Base
  validates :email, :name, :address, :city, :county, :post_code, :phone, presence: true

  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  def self.calculate_shipping_cost(post_code)
    case post_code.split[0].upcase #splits the string based on spaces and returns first part, then convert it to upper case
      when "RH"
        25
      when "BN"
        25
      when "CA"
        45
      when "EX"
        45
      when "LD"
        48
      when "LL"
        48
      when "PL"
        48
      when "SY"
        48
      when "TA"
        48
      when "TQ"
        48
      when "E"
        48
      when "EC"
        48
      when "N"
        48
      when "NW"
        48
      when "SE"
        48
      when "SW"
        48
      when "W"
        48
      when "WC"
        48
      when "DG"
        58
      when "EH"
        58
      when "FK"
        58
      when "KA"
        58
      when "KY"
        58
      when "ML"
        58
      when "PA"
        58
      when "SA"
        58
      when "TD"
        58
      when "TR"
        58
      else
        nil
    end
  end
end
