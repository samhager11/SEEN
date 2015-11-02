class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :post
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
