class Category < ActiveRecord::Base
  has_many :services

  def to_s
    name
  end
end
