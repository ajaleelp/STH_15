class TeamsController < ApplicationController

	respond_to :json

	def create
		@team = Team.new(team_params)
    	@team.save
    	respond_with @team
	end

	def index
		@teamnames = Team.all.pluck(:name)
		respond_with @teamnames
	end

	def game
		@team = Team.friendly.find(params[:id])
		@clue = Clue.find(@team.score)
		json_resp = {clue_img: @clue.clue_img, map_img: @clue.map_image}.to_json
		respond_with json_resp
	end

	def gamepass
		@team = Team.friendly.find(params[:id])
		@clue = Clue.find(@team.score)
		json_resp = {pass: @clue.pass}.to_json
		respond_with json_resp, location: @team
	end

	def score
		json_resp = Team.all.map{|user| ("name:#{user.name},score:#{user.score}").to_json}.to_json
		respond_with json_resp
	end

  private
  def team_params
    params.require(:team).permit(:name,:score)
  end

end
