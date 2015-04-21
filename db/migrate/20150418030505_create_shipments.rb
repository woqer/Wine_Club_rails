class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.datetime :date
      t.string :status
      t.integer :package_id

      t.timestamps
    end
  end
end
