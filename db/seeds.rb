# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

data_folder = Rails.root.join("lib", "data")

# Reading JSON objects from data folder
sub = JSON.parse(File.read(File.join(data_folder, "sub.json"))).flat_map { |k,sub| sub }.first
admin = JSON.parse(File.read(File.join(data_folder, "admin.json")))
wines = JSON.parse(File.read(File.join(data_folder, "wines.json"))).flat_map { |k,wine| wine }
note = JSON.parse(File.read(File.join(data_folder, "note.json"))).flat_map { |k,note| note }.first

shipments = [
  { status: "delivered", date: DateTime.new(2015, 3, 27), subscriber_id: 1 },
  { status: "cancelled", date: DateTime.new(2015, 4, 17), subscriber_id: 1 },
  { status: "scheduled", date: DateTime.new(2015, 6, 26), subscriber_id: 1 }
]

packages = [
  { mix: "AR", shipment_id: 1, note: note },
  { mix: "AW", shipment_id: 2 },
  { mix: "RW", shipment_id: 3 }
]

bottles = [
  # All Whites selection
  { wine_id: 1, package_id: 2 },
  { wine_id: 1, package_id: 2 },
  { wine_id: 1, package_id: 2 },
  { wine_id: 1, package_id: 2 },
  { wine_id: 1, package_id: 2 },
  { wine_id: 1, package_id: 2 },
  # All Reds selection
  { wine_id: 2, package_id: 1 },
  { wine_id: 2, package_id: 1 },
  { wine_id: 2, package_id: 1 },
  { wine_id: 2, package_id: 1 },
  { wine_id: 2, package_id: 1 },
  { wine_id: 2, package_id: 1 },
  # Reds and Whites selection
  { wine_id: 2, package_id: 3 },
  { wine_id: 2, package_id: 3 },
  { wine_id: 2, package_id: 3 },
  { wine_id: 1, package_id: 3 },
  { wine_id: 1, package_id: 3 },
  { wine_id: 1, package_id: 3 }
]

address_params = sub.delete("address")

address = Address.create(address_params)
subscriber = Subscriber.new(sub)
subscriber.address = address

subscriber.save

Admin.create(admin)

wines.each do |wine|
  Wine.create(wine)
end

shipments.each do |shipment|
  Shipment.create(shipment)
end

packages.each do |package|
  Package.create(package)
end

bottles.each do |bottle|
  Bottle.create(bottle)
end
