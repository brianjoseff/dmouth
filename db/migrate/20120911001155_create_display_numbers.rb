class CreateDisplayNumbers < ActiveRecord::Migration
  def change
    create_table :display_numbers do |t|
      t.integer :number_of_articles

      t.timestamps
    end
  end
end
