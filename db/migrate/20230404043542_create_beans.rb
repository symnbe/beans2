class CreateBeans < ActiveRecord::Migration[6.1]
  def change
    create_table :beans do |t|
      t.string :store_name
      t.text :opinion

      t.timestamps
    end
  end
end
