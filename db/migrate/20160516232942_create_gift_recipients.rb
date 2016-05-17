class CreateGiftRecipients < ActiveRecord::Migration
  def change
    create_table :gift_recipients do |t|
      t.string :first_name
      t.string :last_name
      t.string :shipping_address_line_1
      t.string :shipping_address_zip
      t.string :shipping_address_line_state
      t.string :shipping_address_city
      t.string :shipping_address_country
      t.string :shipping_address_country_code, :default => 'US'
      t.integer :gifter_id
      t.integer :preference_id
      t.timestamps null: false
    end
  end
end
