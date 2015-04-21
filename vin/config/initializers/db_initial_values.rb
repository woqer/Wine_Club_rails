#encoding: utf-8

data_folder = Rails.root.join("lib", "data")

# illegal = JSON.parse(File.read(File.join(data_folder, "illegal_states.json")))

wines = JSON.parse(File.read(File.join(data_folder, "wines.json"))).flat_map { |k,wine| wine }

wines.each do |wine|
  Wine.create(wine)
end
