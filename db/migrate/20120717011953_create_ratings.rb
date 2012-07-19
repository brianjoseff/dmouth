class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :quality
      t.integer :readagain
      t.integer :interest
      t.string :qualitative

      t.timestamps
    end
  end
end
