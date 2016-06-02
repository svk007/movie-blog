class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :name
      t.string :username
      t.timestamps null: false
    end
  end
end
