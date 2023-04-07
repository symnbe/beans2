class RemoveStoreNameFromBeans < ActiveRecord::Migration[6.1]
  def change
    remove_column :beans, :store_name, :string
  end
end
