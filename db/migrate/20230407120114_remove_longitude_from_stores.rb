class RemoveLongitudeFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :longitude, :float
  end
end
