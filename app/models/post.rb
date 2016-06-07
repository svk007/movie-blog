class Post < ActiveRecord::Base
  acts_as_votable
  has_many :comments, dependent: :destroy
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_presence_of :name
  extend FriendlyId
  friendly_id :name, use: :slugged
end
