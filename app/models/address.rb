class Address < ActiveRecord::Base
  has_one :user
  accepts_nested_attributes_for :user
  has_many :address_names
  accepts_nested_attributes_for :address_names
  has_many :photos
  accepts_nested_attributes_for :photos
  has_many :forums
  accepts_nested_attributes_for :forums

  def setLatitudeDegree
    Address.latitude_deg = Address.latitude

  end

end
