class TeamsController < ApplicationController

	respond_to :json, :html

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
		@team = Team.find(params[:id])
		@clue = Clue.find(@team.score)
		json_resp = {clue_img: @clue.clue_img, map_img: @clue.map_image}.to_json
		respond_with json_resp
	end

	def gamepass
		@team = Team.find(params[:id])
		@clue = Clue.find(@team.score)
		json_resp = {pass: @clue.pass}.to_json
		respond_with json_resp
	end

  private
  def team_params
    params.require(:team).permit(:name,:score)
  end

end
