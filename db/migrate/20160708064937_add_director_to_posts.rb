class AddDirectorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :director, :string
  end
end
