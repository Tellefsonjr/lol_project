class Favorite < ActiveRecord::Base
  include PublicActivity::Common
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
  belongs_to :user
  belongs_to :summoner
  after_save do
    self.create_activity :create, owner: self.user, recipient: self.summoner
  end
end
