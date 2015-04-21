class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.integer :wine_id
      t.integer :package_id

      t.timestamps
    end
  end
end
