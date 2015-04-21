class AddSubscriberIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :subscriber_id, :integer
  end
end
