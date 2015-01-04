class WelcomeController < ApplicationController
  respond_to :json

  def index
  	render status: :ok
  end
end
