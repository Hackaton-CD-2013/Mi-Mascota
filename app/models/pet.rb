class Pet < ActiveRecord::Base
  belongs_to :user

  CAT  = 'cat'
  DOG  = 'dog'
  BIRD = 'bird'
  RABBIT = 'rabbit'

  mount_uploader :photo, ImageUploader
end

