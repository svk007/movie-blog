class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.integer :year
      t.text :review
      t.timestamps null: false
    end
  end
end
