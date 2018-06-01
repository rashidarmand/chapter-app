class AddTimeZoneToUserTable < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :time_preference, :integer

    add_column :users, :time_zone, :integer
  end
end
