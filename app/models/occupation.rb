class Occupation < ActiveRecord::Base
  has_many :subscribers
end
