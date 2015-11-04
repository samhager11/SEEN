class User < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos
  has_many :forums
  accepts_nested_attributes_for :forums
  belongs_to :address
  accepts_nested_attributes_for :address

  has_secure_password

  validates :phone_number, presence:true, uniqueness:true

end
