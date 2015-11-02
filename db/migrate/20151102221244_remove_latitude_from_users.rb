class RemoveLatitudeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :latitude, :integer
  end
end
