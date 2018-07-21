class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @players = Player.where(team_id: @team.id).order(:last_name)
    @lineup = Lineup.find_by(team_id: @team.id)
  end
end
