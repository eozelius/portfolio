class Journey < ActiveRecord::Base
  belongs_to :driftmap
  has_many :waypoints, dependent: :destroy

  mount_uploader :coverphoto, PictureUploader

  validates :driftmap_id, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
end