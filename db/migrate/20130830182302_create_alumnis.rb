class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
      t.string :tsl_key
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
