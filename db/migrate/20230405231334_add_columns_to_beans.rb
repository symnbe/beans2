class AddColumnsToBeans < ActiveRecord::Migration[6.1]
  def change
    add_column :beans, :production_area, :integer
    add_column :beans, :degree_of_roasting, :integer
    add_column :beans, :price, :string
    add_column :beans, :user_id, :integer
  end
end
