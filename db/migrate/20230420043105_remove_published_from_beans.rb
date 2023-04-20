class RemovePublishedFromBeans < ActiveRecord::Migration[6.1]
  def change
    remove_column :beans, :published, :boolean
  end
end
