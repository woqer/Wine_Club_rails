class ChangeShipPackageRelation < ActiveRecord::Migration
  def change
    remove_column :shipments, :package_id

    add_column :packages, :shipment_id, :integer
  end
end
