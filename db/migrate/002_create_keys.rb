class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.references :user
      t.string :name
      t.string :key
      t.timestamps
    end
    add_index :keys, :user_id
  end
end
