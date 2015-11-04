class ChangePhoneNumberTypeInUser < ActiveRecord::Migration
  def change
    change_column :users, :phone_number, :integer, :limit => 10
  end
end
