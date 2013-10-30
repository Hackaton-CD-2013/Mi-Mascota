class Post < ActiveRecord::Base
  belongs_to :pet
  belongs_to :user

  LOST  = 'lost'
  FOUND = 'found'
end
