class Article < ActiveRecord::Base
  is_impressionable :counter_cache => { :column_name => :counter_cache }
  acts_as_taggable_on :tags
  
  has_many :assets, :as => :imageable, :dependent => :destroy
  has_many :ratings
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  
end
