class HomeController < ApplicationController

  def home
    @todays_games = Game.where(date: Date.parse('29/03/2018'))
    @teams = Team.all
    @news = NewsStory.all.order('id DESC')

    @leaders = PitchingStat.pitching_league_leaders

    @batting_leaders = BattingStat.batting_league_leaders
  end
  
end
