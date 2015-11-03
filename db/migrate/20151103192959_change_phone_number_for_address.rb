class ChangePhoneNumberForAddress < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
	     t.change :phone_number, :string
  end
end
end
