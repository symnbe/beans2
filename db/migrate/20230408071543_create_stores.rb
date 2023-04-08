class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.text :website
      t.string :phone_number
      t.string :opening_hours
      t.string :closing_hours
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
