class RemoveLongitudeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :longitude, :integer
  end
end
