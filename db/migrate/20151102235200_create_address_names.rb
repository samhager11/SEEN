class CreateAddressNames < ActiveRecord::Migration
  def change
    create_table :address_names do |t|
      t.integer :degree
      t.integer :minute
      t.string :name_part

      t.timestamps null: false
    end
  end
end
