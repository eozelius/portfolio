class Essay < ActiveRecord::Base
  belongs_to :waypoint
  has_many   :waypoint_images, dependent: :destroy

  validates :title,       presence: true, length: { minimum: 4, maximum: 120 }
  validates :body,        presence: true, length: { minimum: 4, maximum: 10000 }
  validates :x,           presence: true
  validates :y,           presence: true
  validates :coverphoto,  presence: true

  mount_uploader :coverphoto, PictureUploader
end