json.array! @products do |product|
  json.brand product.brand
  json.name product.name
end