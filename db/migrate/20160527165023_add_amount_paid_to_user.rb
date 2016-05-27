class AddAmountPaidToUser < ActiveRecord::Migration
  def change
    add_column :users, :amount_paid, :string
  end
  
end
