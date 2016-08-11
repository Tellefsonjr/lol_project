class Post < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  #Default order by latest post first
  default_scope -> { order(created_at: :desc) }
  after_save do
    self.create_activity :create, owner: self.user
  end
end
