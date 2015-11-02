class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :country
      t.decimal :latitude
      t.integer :latitude_deg
      t.integer :latitude_min
      t.integer :latitude_sec
      t.string :latitude_name_part
      t.decimal :longitude
      t.integer :longitude_deg
      t.integer :longitude_min
      t.integer :longitude_sec
      t.string :longitude_name_part
      t.string :address
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
