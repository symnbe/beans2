class RemoveStoreNameFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :store_name, :string
  end
end
