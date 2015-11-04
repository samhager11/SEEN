class ChangeLatitudeSecTypeInAddress < ActiveRecord::Migration
  def change
    change_column :addresses, :latitude_sec, :decimal
  end
end
