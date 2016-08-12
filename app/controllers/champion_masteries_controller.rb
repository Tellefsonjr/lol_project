class ChampionMasteriesController < ApplicationController

  def create
    summoner = Summoner.find_by(:region => params[:region], :name => params[:name])
    champion_masteries = Riot.get_champion_masteries( summoner.region, summoner.summonerId)
    @champion_masteries = ChampionMastery.build_masteries(champion_masteries, summoner.id)
    redirect_to summoner
  end

  def update
    

  end

end
