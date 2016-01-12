class AddCountryAndTimeZoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :language, :string
    add_column :users, :time_zone, :string
  end
end
