class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string     :code
      t.string     :amount
      t.string     :campaign
      t.datetime   :expiration_date
      t.timestamps null: false
    end
  end
end
