class RemoveCreatedAtFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :created_at, :datetime
  end
end
