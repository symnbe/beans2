class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id, foreign_key: true
      t.integer :bean_id, foreign_key: true

      t.timestamps
      t.index [:follower_id, :followed_id], unique: true
    end
  end
end
