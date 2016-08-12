class Summoner < ActiveRecord::Base
	include PublicActivity::Common

	has_many :champion_masteries, :dependent => :destroy
	has_many :matches, :dependent => :destroy
	has_many :champions, {through: :champion_masteries, source: :champions}
	has_many :favorites
	has_many :users, through: :favorites

	def self.build_summoner(attributes, region)
		summoner = Summoner.new()
		summoner.name = attributes['name']
		summoner.region = region
		summoner.summonerLevel = attributes['summonerLevel']
		summoner.summonerId = attributes['id']
		summoner.profileIconId = attributes['profileIconId']
		summoner.revisionDate = attributes['revisionDate']
		summoner.icon = "http://ddragon.leagueoflegends.com/cdn/6.16.2/img/profileicon/" + summoner.profileIconId.to_s + ".png"
		return summoner
	end
	before_save do
		self.name.downcase!
	end

	before_update do
		if self.changed?
	 		self.create_activity :update, owner: self, parameters: self.changes
		end
	end
	def update_summoner(summoner, region)
		self.update(
			{
			:region => region,
			:summonerLevel => summoner['summonerLevel'],
			:summonerId => summoner['id'],
			:profileIconId => summoner['profileIconId'],
			:revisionDate => summoner['revisionDate'],
			:icon => "http://ddragon.leagueoflegends.com/cdn/6.16.2/img/profileicon/" + summoner['profileIconId'].to_s + ".png"
				}
			)
	end
	def updated_recently?
		#returns true if not updated recently...
	 self.updated_at > 1.hours.ago
	end
end
