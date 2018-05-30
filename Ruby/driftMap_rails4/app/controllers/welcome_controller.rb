class WelcomeController < ApplicationController
	def index
    @ethan = User.find(1)
    @journeys = @ethan.driftmap.journeys
	end
end