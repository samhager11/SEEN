class Photo < ActiveRecord::Base
    belongs_to :user
    belongs_to :address
    has_many :comments

    # attr_accessible :user_id,:address_id,:name:,:image
    mount_uploader :image, ImageUploader

    validates :image, presence:true


  def date_published
   created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end

  


end
