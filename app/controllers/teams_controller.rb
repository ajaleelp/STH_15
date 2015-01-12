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
    if Solvetime.where(team_id: @team.id).empty? #team never logged in
      @gamestart = Solvetime.new(team_id: @team.id, clue_id: "0", solved_at: Time.now)
      @gamestart.save
    end
		@clue = Clue.find(@team.score)
		json_resp = {clue_img: @clue.clue_img, map_img: @clue.map_image}.to_json
		respond_with json_resp
	end

	def gamepass
		@team = Team.friendly.find(params[:id])
		@pass = params[:pass]
		if @pass == Clue.find(@team.score).pass
			@team.score += 1
			if @team.save
				@clue = Clue.find(@team.score)
				json_resp = {status: 'success', clue_img: @clue.clue_img, map_img: @clue.map_image}.to_json
        @newsolvetime = Solvetime.new(team_id: @team.id, clue_id: Clue.find(@team.score - 1).id,solved_at: Time.now, solved_by: (Time.now - @team.solvetimes.last.solved_at)/3600
 )
        @newsolvetime.save
      end
    else
      json_resp = {status: 'failure'}.to_json
    end
    respond_with json_resp, location: @team
	end

	def score
		@teams = Team.all
		respond_with(@teams) do |format|
			format.json {render :json => @teams.to_json(only: [:name, :score])}
		end
		# json_resp = Team.pluck(:name,:score).to_json
		# respond_with json_resp
	end

  def graph
    @teams = Team.all
    json_resp = @teams.to_json(:only => :name, :include => {:solvetimes => { :only => :solved_by}})
    # @teams.each do |team|
    #   json_resp << {team: team.name, times: Solvetime.where(team_id: team.id)}.pluck(:solved_at)}
    # end
    # json_resp.to_json
    respond_with json_resp
  end

  private
  def team_params
    params.require(:team).permit(:name,:score)
  end

end
