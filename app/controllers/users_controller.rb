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
		json_resp = @user.present? ? {name: @user.name,teamName: @user.team.present? ? @user.team.name : 'not assigned',remainingsteps: 10 - @user.team.score,pvt_ch: 'channel '+@user.team.id.to_s}.to_json : {status: "No user found"}
		respond_with json_resp
	end

	def map
		encoded = Base64.encode64("clue") 
		json_resp = {clue_img: Base64.encode64(open().read), map_img:Base64.decode64(encoded)}.to_json
		respond_with json_resp
	end


	private
	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end
end
