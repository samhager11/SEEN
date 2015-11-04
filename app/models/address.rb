class Address < ActiveRecord::Base
  has_one :user
  accepts_nested_attributes_for :user
  has_many :address_names
  accepts_nested_attributes_for :address_names
  has_many :photos
  accepts_nested_attributes_for :photos
  has_many :forums
  accepts_nested_attributes_for :forums
  before_save :addressName

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

  @lat_deg
  @lat_min
  @lat_sec
  @long_deg
  @long_min
  @long_sec


  def addressName
    self.latitude_deg = Integer(self.latitude)
    self.latitude_min = Integer((self.latitude-self.latitude_deg)*60)
    self.latitude_sec = ((self.latitude-self.latitude_deg-(self.latitude_min.to_f/60))*3600)
    if self.latitude_sec%1 != 0
      self.latitude_sec = Integer((self.latitude_sec*10).round(0))
    end
    self.latitude_name_part = AddressName.where(:degree => self.latitude_deg).first.name_part + AddressName.where(:minute => self.latitude_min).first.name_part
    #set if for negative number

    self.longitude_deg = Integer(self.longitude)
    self.longitude_min = Integer((self.longitude-self.longitude_deg)*60)
    self.longitude_sec = ((self.longitude-self.longitude_deg-(self.longitude_min.to_f/60))*3600)
    if self.longitude_sec%1 != 0
      self.longitude_sec = Integer((self.longitude_sec*10).round(0))
    end
    self.longitude_name_part = AddressName.where(:degree => self.longitude_deg).first.name_part + AddressName.where(:minute => self.longitude_min).first.name_part


    self.address = self.latitude_name_part + ' ' + self.longitude_name_part + ' '+self.latitude_sec.to_s + self.longitude_sec.to_s
  end

  # getLatCor(@lat_deg,@lat_min,@lat_sec)

  # Remember to do Integer((@lat_sec).round(1)*10)) for address conversion
  # if @lat_deg < 0, @lat_deg*-1+90 to get name and reverse on conversion out
  # if @long_deg < 0, @long_deg*-1+180 to get name and reverse on conversion out
end
