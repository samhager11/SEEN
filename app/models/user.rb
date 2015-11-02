class User < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos
  has_many :forums
  accepts_nested_attributes_for :forums

end
