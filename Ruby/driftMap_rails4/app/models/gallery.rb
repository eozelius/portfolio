class Gallery < ActiveRecord::Base
  belongs_to :waypoint
  has_many :waypoint_images, dependent: :destroy
  
  


  mount_uploader :coverphoto, PictureUploader
end