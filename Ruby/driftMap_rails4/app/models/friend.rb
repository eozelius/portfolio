class Friend < ActiveRecord::Base
  # ActiveRecord
  belongs_to :waypoint

  # Validations
  validates :first_name,  presence: true, length: { minimum: 4, maximum: 120 }
  validates :description, presence: true, length: { minimum: 4, maximum: 1000 }
  validates :x,           presence: true
  validates :y,           presence: true

  # Methods
  mount_uploader :photo, PictureUploader

end
