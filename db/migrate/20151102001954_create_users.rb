class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :country
      t.integer :phone_number
      t.integer :latitude
      t.integer :longitude
      t.string :address

      t.timestamps null: false
    end
  end
end
