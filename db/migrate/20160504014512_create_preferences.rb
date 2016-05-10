class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :style_on_course
      t.string :dress_for_work
      t.string :shirt_fit
      t.string :pant_fit
      t.string :shirt_size
      t.string :waist_size
      t.string :pant_length
      t.string :philosophy_on_clothing
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
