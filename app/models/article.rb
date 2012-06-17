class Article < ActiveRecord::Base
  has_many :assets, :as => :imageable, :dependent => :destroy
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
end
