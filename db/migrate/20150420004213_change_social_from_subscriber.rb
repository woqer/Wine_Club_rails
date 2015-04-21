class ChangeSocialFromSubscriber < ActiveRecord::Migration
  def change
    remove_column :subscribers, :fb
    remove_column :subscribers, :tw

    add_column :subscribers, :facebook, :string
    add_column :subscribers, :twitter, :string
  end
end
