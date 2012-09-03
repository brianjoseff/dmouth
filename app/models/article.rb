class Article < ActiveRecord::Base
  is_impressionable :counter_cache => { :column_name => :counter_cache }
  
  has_many :assets, :as => :imageable, :dependent => :destroy
  has_many :ratings
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  
end
