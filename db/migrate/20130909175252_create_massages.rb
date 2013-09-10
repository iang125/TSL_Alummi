class CreateMassages < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.string :user1_id
      t.string :user2_id
      t.string :massage

      t.timestamps
    end
  end
end
