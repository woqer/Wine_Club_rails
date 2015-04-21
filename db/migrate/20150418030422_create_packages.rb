class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :wine1_id
      t.integer :wine2_id
      t.integer :wine3_id
      t.integer :wine4_id
      t.integer :wine5_id
      t.integer :wine6_id
      t.string :type
      t.string :note

      t.timestamps
    end
  end
end
