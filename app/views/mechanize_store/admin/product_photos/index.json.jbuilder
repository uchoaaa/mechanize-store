json.array! @product_photos do |product_photo|
    json.name product_photo.file_file_name
    json.size product_photo.file_file_size
    json.thumbnailUrl url_for(product_photo.file.url(:thumb))
    json.mediumUrl url_for(product_photo.file.url(:medium))
    json.url url_for(product_photo.file.url)
    json.deleteUrl product_photo_path(product_photo)
    json.deleteType "DELETE"
end