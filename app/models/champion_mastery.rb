class ChampionMastery < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :summoner
  belongs_to :champion
  has_many :champs, :dependent => :destroy
  has_many :champions, through: :champs

  def self.build_masteries(champion_masteries, summoner_id)
    all_masteries = []
    champion_masteries.each do |this|
      champion = Champion.find_by(:championId => this['championId'])
      lastPlayTime = DateTime.strptime(this['lastPlayTime'].to_s, '%Q')

      new_mastery = ChampionMastery.new(
      summoner_id: summoner_id,
      champion_id: champion.id,
      current_points: this['championPoints'],
      championPointsSinceLastLevel: this['championPointsSinceLastLevel'],
      championPointsUntilNextLevel: this['championPointsUntilNextLevel'],
      tokensEarned: this['tokensEarned'],
      championLevel: this['championLevel'],
      chestGranted: (this['chestGranted']).to_s,
      lastPlayTime: lastPlayTime
      )
      if new_mastery.save
        puts "Mastery was built and saved!"
        all_masteries << new_mastery
        Champ.create(
        champion_id: champion.id,
        champion_mastery_id: new_mastery.id
        )
      else
        puts "Mastery attempted to be built and already existed."
      end
    end
    return all_masteries
  end
  def self.update_masteries(champion_masteries, summoner_id)
    unlogged_masteries = []
    champion_masteries.each do |mastery|
      #check if mastery in DB
      lastPlayTime = DateTime.strptime(mastery['lastPlayTime'].to_s, '%Q')
      champion = Champion.find_by(:championId => mastery['championId'])
      if ChampionMastery.exists?(champion_id: champion.id)
        mastery.update(
          current_points: mastery['championPoints'],
          championPointsSinceLastLevel: mastery['championPointsSinceLastLevel'],
          championPointsUntilNextLevel: mastery['championPointsUntilNextLevel'],
          tokensEarned: mastery['tokensEarned'],
          championLevel: mastery['championLevel'],
          chestGranted: (mastery['chestGranted']).to_s,
          lastPlayTime: lastPlayTime
        )
      else
        unlogged_masteries << mastery
      end
      if unlogged_masteries.length > 0
        summoner = Summoner.find(summoner_id)
        ChampionMastery.build_masteries(unlogged_masteries, summoner.id)
      end
    end
  end
  before_update do
    self.create_activity :update, owner: self.summoner, parameters: self.changes
  end


end
