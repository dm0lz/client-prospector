
json.positions @clients do |client|
  json.position do
  json.name client.name
  json.lat client.latitude.to_f
  json.lng client.longitude.to_f
  end
  json.key client.id
  json.showInfo false
  json.infoContent client.infos
end
