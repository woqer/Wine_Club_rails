class AddSubscriberToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :subscriber_id, :integer
  end
end
