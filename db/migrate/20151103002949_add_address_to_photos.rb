class AddAddressToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :address, index: true, foreign_key: true
  end
end
