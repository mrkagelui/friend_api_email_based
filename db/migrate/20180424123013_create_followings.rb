class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.string :source, index: true
      t.string :audience

      t.timestamps
    end
    add_index :followings, [:source, :audience], unique: true
  end
end
