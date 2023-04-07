class RemoveAddressFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :address, :string
  end
end
