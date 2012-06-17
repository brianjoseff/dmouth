class AddImageableToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :imageable_id, :integer

    add_column :assets, :imageable_type, :string

  end
end
