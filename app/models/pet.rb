class Pet < ActiveRecord::Base
  belongs_to :user

  CAT  = 'cat'
  DOG  = 'dog'
  BIRD = 'bird'

  mount_uploader :photo, ImageUploader
end

