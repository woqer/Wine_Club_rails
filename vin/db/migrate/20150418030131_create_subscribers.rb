class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :address_id
      t.string :fb
      t.string :tw

      t.timestamps
    end
  end
end
