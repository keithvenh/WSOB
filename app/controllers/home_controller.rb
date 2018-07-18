class HomeController < ApplicationController

  def home
    @todays_games = Game.where(date: Date.parse('29/03/2018'))
    @teams = Team.all
    @news = NewsStory.all.order('id DESC')
  end
  
end
