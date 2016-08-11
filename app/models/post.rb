class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  #Default order by latest post first
  default_scope -> { order(created_at: :desc) }

end
