class PlayersController < ApplicationController

  def index
    @players = Player.all.order(last_name: :asc).order(first_name: :asc)
  end 

  def show
    @player = Player.find(params[:id])
  end

end
