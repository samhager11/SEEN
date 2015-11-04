class ChangeLongitudeSecTypeInAddress < ActiveRecord::Migration
  def change
    change_column :addresses, :longitude_sec, :decimal
  end
end
