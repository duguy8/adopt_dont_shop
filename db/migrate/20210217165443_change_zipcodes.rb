class ChangeZipcodes < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :zipcode
    add_column :applications, :zipcode, :string
    remove_column :shelters, :zip
    add_column :shelters, :zip, :string
  end
end
