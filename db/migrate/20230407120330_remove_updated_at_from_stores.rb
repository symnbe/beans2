class RemoveUpdatedAtFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :updated_at, :datetime
  end
end
