class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  CAT  = 'cat'
  DOG  = 'dog'
  BIRD = 'bird'
  RABBIT = 'rabbit'

  mount_uploader :photo, ImageUploader
end

