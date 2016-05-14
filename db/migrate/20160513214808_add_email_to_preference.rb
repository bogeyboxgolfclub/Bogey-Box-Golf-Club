class AddEmailToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :email, :string
  end
end
