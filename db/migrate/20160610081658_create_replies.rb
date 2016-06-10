class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.string :author
      t.references :comment
      t.timestamps null: false
    end
  end
end
