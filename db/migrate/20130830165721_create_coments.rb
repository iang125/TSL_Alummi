class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.integer :user_id
      t.integer :coment_id

      t.timestamps
    end
  end
end
