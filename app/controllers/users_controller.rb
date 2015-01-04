class UsersController < ApplicationController 

	respond_to :json

	def new
		render status: :ok
	end

	def create
		@user = User.new(user_params)
		@user.save
		respond_with @user
	end

	def show
		@user = User.find(params[:id])
		json_resp = {name: @user.name,teamName: @user.team.present? ? @user.team.name : 'not assigned',remainingsteps: 10 - @user.team.score,pvt_ch: 'channel '+@user.team.id.to_s}.to_json
		respond_with json_resp
	end

	def map
		json_resp = {clue_img:'imgbase64string', map_img:'mapbase64string'}.to_json
		respond_with json_resp
	end


	private
	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end
end
