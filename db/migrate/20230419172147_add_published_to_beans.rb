class AddPublishedToBeans < ActiveRecord::Migration[6.1]
  def change
    add_column :beans, :published, :boolean, default: true
  end
end
