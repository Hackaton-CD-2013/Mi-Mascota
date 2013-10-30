class Pet < ActiveRecord::Base
  belongs_to :user

  CAT  = 'cat'
  DOG  = 'dog'
  BIRD = 'bird'
end
