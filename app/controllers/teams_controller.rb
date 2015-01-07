class TeamsController < ApplicationController
	respond_to :json

	def index
		@teamnames = Team.all.pluck(:name)
		respond_with @teamnames
	end
end
