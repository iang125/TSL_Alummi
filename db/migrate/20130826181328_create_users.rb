class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :class_id
      t.string :email
      t.string :password_digest
      t.string :adress
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.string :github_id
      t.string :twiter_id
      t.string :fb_id
      t.timestamps
    end
  end
end
