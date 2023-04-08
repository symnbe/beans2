class CreateBeans < ActiveRecord::Migration[6.1]
  def change
    create_table :beans do |t|
      t.string :bean_name
      t.text :opinion
      t.integer :degree_of_roasting
      t.string :price
      t.integer :user_id, foreign_key: true, null: false
      t.integer :production_area_id, foreign_key: true, null: false
      t.integer :store_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
