class Driftmap < ActiveRecord::Base
	belongs_to :user
	has_many :journeys, dependent: :destroy

	validates :title, 	:presence => true, :length => { minimum: 4 }
	validates :body, 	:presence => true, :length => { maximum: 5000 }
	validates :user_id, :presence => true
	validates :init_x,		:presence => true, :length => { maximum: 99999, minimum: 0 } 
	validates :init_y,		:presence => true, :length => { maximum: 99999, minimum: 0 } 
	validates :init_zoom,	:presence => true, :length => { maximum: 99999, minimum: 0 }
end