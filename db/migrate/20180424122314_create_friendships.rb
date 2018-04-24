class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.string :friend1, index: true
      t.string :friend2, index: true

      t.timestamps
    end
    add_index :friendships, [:friend1, :friend2], unique: true
  end
end
