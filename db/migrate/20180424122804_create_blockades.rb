class CreateBlockades < ActiveRecord::Migration[5.1]
  def change
    create_table :blockades do |t|
      t.string :blocker
      t.string :blockee, index: true

      t.timestamps
    end
    add_index :blockades, [:blocker, :blockee], unique: true
  end
end
