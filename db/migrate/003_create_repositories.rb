class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :path
      t.integer :owner_id
      t.timestamps
    end
    add_index :repositories, :owner_id
  end
end
