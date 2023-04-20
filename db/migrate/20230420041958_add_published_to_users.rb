class AddPublishedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :published, :boolean, default: true
  end
end
