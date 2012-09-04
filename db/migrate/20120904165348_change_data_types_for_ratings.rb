class ChangeDataTypesForRatings < ActiveRecord::Migration
  def up
    change_table :ratings do |t|
      t.change :quality, :float
      t.change :readagain, :float
      t.change :interest, :float
    end
  end

  def down
    change_table :ratings do |t|
      t.change :quality, :integer
      t.change :readagain, :integer
      t.change :interest, :integer
    end
  end
end
