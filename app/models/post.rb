class Post < ActiveRecord::Base
  acts_as_votable
  has_many :comments, dependent: :destroy
  has_attached_file :image,
  storage: :fog,
  fog_credentials: {google_storage_access_key_id: 'GOOG6ZKIR4VVUBSI7Q2G',
    google_storage_secret_access_key: '3MLsKF8KFmv36MpfvbPYVYWl7z06PWEmCkfdr+jJ',
    provider: 'Google',
    path_style: true
    },
  fog_directory: "trail-1353.appspot.com"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
  validates_presence_of :year
  validates_presence_of :image
  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.movie_name(movie_name)
    if movie_name
      self.where("lower(name) LIKE ?", "%#{movie_name}%".downcase)
    else
      self.all
    end
  end
end
