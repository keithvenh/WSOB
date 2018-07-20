class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @innings = Inning.where(game_id: @game.id)
  end
end
