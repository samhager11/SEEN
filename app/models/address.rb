class Address < ActiveRecord::Base
  has_one :user
  accepts_nested_attributes_for :user
  has_many :address_names
  accepts_nested_attributes_for :address_names
  has_many :photos
  accepts_nested_attributes_for :photos
  has_many :forums
  accepts_nested_attributes_for :forums

  @lat_deg
  @lat_min
  @lat_sec

  def setLatVar(coordinate)
      @lat_deg = Integer(coordinate)
      @lat_min = Integer((coordinate-@lat_deg)*60)
      @lat_sec = ((coordinate-@lat_deg-(@lat_min.to_f/60))*3600)
      puts @lat_deg
      puts @lat_min
      puts @lat_sec
  end

  # setLatVar(36.794652)


  def getLatCor(deg,min,sec)
     puts deg + (min+(sec/60))/60
  end

  getLatCor(@lat_deg,@lat_min,@lat_sec)

  # Remember to do Integer((@lat_sec).round(1)*10)) for address conversion
  # if @lat_deg < 0, @lat_deg*-1+90 to get name and reverse on conversion out
  # if @long_deg < 0, @long_deg*-1+180 to get name and reverse on conversion out
end
