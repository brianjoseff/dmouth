class AddCounterCacheToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :counter_cache, :integer

  end
end
