class Post < ActiveRecord::Base
  belongs_to :pet
  belongs_to :user

  LOST     = 'lost'
  FOUND    = 'found'
  ADOPTION = 'adoption'
  MATE     = 'mate'

  scope :lost,       -> { where(kind: LOST) }
  scope :found,      -> { where(kind: FOUND) }
  scope :adoption,   -> { where(kind: ADOPTION) }
  scope :mate,       -> { where(kind: MATE) }

  mount_uploader :photo, ImageUploader
end
