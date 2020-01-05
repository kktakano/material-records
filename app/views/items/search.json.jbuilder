json.array! @materials do |material|
  json.id material.id
  json.image url_for(material.image) if material.image.attached?
  # json.image('m_e_others_501.png') unless material.image.attached?
  json.name material.name
  json.price material.price
  json.value material.value
  json.unit material.unit
  json.user_id material.user_id
end