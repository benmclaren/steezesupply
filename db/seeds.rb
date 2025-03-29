# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Brand.destroy_all
puts "all brands destroyed"

brands = [
  { name: "Oakley", image: "oakley.png" },
  { name: "ELHO Freestyle", image: "elho_freestyle.png" },
  { name: "Capeesh", image: "capeesh.png" },
  { name: "BUSI Company", image: "busi_company.png" },
  { name: "Spyder", image: "spyder.png" },
  { name: "Harlaut Apparel", image: "harlaut_apparel.png" },
  { name: "Vulgus 365", image: "vulgus_365.png" },
  { name: "Lead Fabrics", image: "lead_fabrics.png" },
  { name: "Jibskin", image: "jibskin.png" },
  { name: "Jiberish", image: "jiberish.png" },
  { name: "Planks", image: "planks.png" },
  { name: "NinetyRoll", image: "ninetyroll.png" }
]

brands.each do |brand_data|
  brand = Brand.create(name: brand_data[:name])
  
  # Attach image from local assets
  brand.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/brands/#{brand_data[:image]}")),
    filename: brand_data[:image],
    content_type: "image/jpeg"
  )

  puts "Created #{brand.name} with image #{brand_data[:image]}"
end
