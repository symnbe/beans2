class AddStoreNameToBeans < ActiveRecord::Migration[6.1]
  def change
    add_column :beans, :store_name, :string
  end
end
