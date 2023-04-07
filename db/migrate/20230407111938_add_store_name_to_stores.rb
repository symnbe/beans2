class AddStoreNameToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :store_name, :string
  end
end
