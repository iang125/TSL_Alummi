class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|

      t.timestamps
    end
  end
end
