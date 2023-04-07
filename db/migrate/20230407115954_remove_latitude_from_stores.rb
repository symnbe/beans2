class RemoveLatitudeFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :latitude, :float
  end
end
