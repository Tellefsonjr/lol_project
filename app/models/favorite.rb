class Favorite < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :user
  belongs_to :summoner
  after_save do
    self.create_activity :create, owner: self.user, recipient: self.summoner
  end
end
