class CreateGifters < ActiveRecord::Migration
  def change
    create_table :gifters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :best_contact_method
      t.string :best_time_of_day
      t.string :product_option
      t.string :typeform_submission_id
      t.timestamps null: false
    end
  end
end
