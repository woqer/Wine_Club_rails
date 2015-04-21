class RemoveAddressFromSubscriber < ActiveRecord::Migration
  def change
    remove_column :subscribers, :address_id
  end
end
