class AddShippingAndBillingDataToUser < ActiveRecord::Migration
  def change
      add_column :users, :stripe_billing_address_line_1, :string
      add_column :users, :stripe_billing_address_zip, :string
      add_column :users, :stripe_billing_address_state, :string
      add_column :users, :stripe_billing_address_city, :string
      add_column :users, :stripe_billing_address_country, :string
      add_column :users, :stripe_billing_address_country_code, :string
      add_column :users, :stripe_shipping_name, :string
      add_column :users, :stripe_shipping_address_line_1, :string
      add_column :users, :stripe_shipping_address_zip, :string
      add_column :users, :stripe_shipping_address_state, :string
      add_column :users, :stripe_shipping_address_city, :string
      add_column :users, :stripe_shipping_address_country, :string
      add_column :users, :stripe_shipping_address_country_code, :string
  end
end
