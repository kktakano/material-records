json.array! @items do |item|
  json.id item.id
  json.image url_for(item.image) if item.image.attached?
  json.name item.name
  json.price item.price
  json.cost item.cost
  json.user_id item.user_id
end