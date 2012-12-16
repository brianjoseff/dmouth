class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.text :interest
      t.text :dislikes
      t.integer :occupation_id
      t.text :submission

      t.timestamps
    end
  end
end
