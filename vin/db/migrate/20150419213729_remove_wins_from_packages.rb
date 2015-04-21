class RemoveWinsFromPackages < ActiveRecord::Migration
  def change
    remove_column :packages, :wine1_id
    remove_column :packages, :wine2_id
    remove_column :packages, :wine3_id
    remove_column :packages, :wine4_id
    remove_column :packages, :wine5_id
    remove_column :packages, :wine6_id
  end
end
