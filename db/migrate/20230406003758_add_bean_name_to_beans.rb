class AddBeanNameToBeans < ActiveRecord::Migration[6.1]
  def change
    add_column :beans, :bean_name, :string
  end
end
