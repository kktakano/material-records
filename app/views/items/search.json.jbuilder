json.array! @materials do |material|
  json.id material.id
  json.image material.image
  json.name material.name
  json.price material.price
  json.value material.value
  json.unit material.unit
  json.user_id material.user_id
end