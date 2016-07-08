# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..9300).each do |i|
  post = Post.find("#{i}")
  if File.file?("#{Rails.root}/Images/#{i}.jpg")
    post.update_attributes!(
      image: File.new("#{Rails.root}/Images/#{i}.jpg"))
  end
end