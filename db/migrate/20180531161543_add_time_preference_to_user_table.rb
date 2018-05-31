class AddTimePreferenceToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :time_preference, :string
  end
end
