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

  validates :city, presence:true
  validates :country, presence:true
  validates :latitude, presence:true
  validates :longitude, presence:true


  def getLatCor(deg,min,sec)
     puts deg + (min+(sec/60))/60
  end


  def addressName
    @adj_lat
    if self.latitude<0
      @adj_lat = Integer(self.latitude*-1+90)
    else
      @adj_lat = Integer(self.latitude)
    end
    self.latitude_deg = Integer(self.latitude)
    self.latitude_min = Integer((self.latitude-self.latitude_deg).abs*60)
    self.latitude_sec = (((self.latitude-self.latitude_deg).abs-(self.latitude_min.to_f/60))*3600)
    @lat_sec_name
    if self.latitude_sec%1 != 0
      @lat_sec_name = Integer((self.latitude_sec*10).round(0))
    end
    self.latitude_name_part = AddressName.where(:degree => @adj_lat).first.name_part + AddressName.where(:minute => self.latitude_min).first.name_part

    #set if for negative number
    @adj_long
    if self.longitude<0
      @adj_long = Integer(self.longitude*-1+180)
    else
      @adj_long = Integer(self.longitude)
    end
    self.longitude_deg = Integer(self.longitude)
    self.longitude_min = Integer((self.longitude-self.longitude_deg).abs*60)
    self.longitude_sec = (((self.longitude-self.longitude_deg).abs-(self.longitude_min.to_f/60))*3600)
    @long_sec_name
    if self.longitude_sec%1 != 0
      @long_sec_name = Integer((self.longitude_sec*10).round(0))
    end

    self.longitude_name_part = AddressName.where(:degree => @adj_long).first.name_part + AddressName.where(:minute => self.longitude_min).first.name_part

    puts @adj_lat
    puts @adj_long

    self.address = (self.latitude_name_part + ' ' + self.longitude_name_part + ' '+@lat_sec_name.to_i.to_s + @long_sec_name.to_i.to_s)
  end

  # getLatCor(@lat_deg,@lat_min,@lat_sec)

  # Remember to do Integer((@lat_sec).round(1)*10)) for address conversion
  # if @lat_deg < 0, @lat_deg*-1+90 to get name and reverse on conversion out
  # if @long_deg < 0, @long_deg*-1+180 to get name and reverse on conversion out
end
