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

Athlete.destroy_all
puts "all athletes destroyed"

athletes = [
  { first_name: "Andri", last_name: "Ragettli", nationality: "Switzerland", age: 26, home_resort: "Laax, Switzerland" },
  { first_name: "Alex", last_name: "Hall", nationality: "United States", age: 26, home_resort: "Park City, Utah" }
]

athletes.each do |athlete_data|
  athlete = Athlete.create(first_name: athlete_data[:first_name], last_name: athlete_data[:last_name], nationality: athlete_data[:nationality], age: athlete_data[:age], home_resort: athlete_data[:home_resort])

  puts "Created #{athlete.first_name} #{athlete.last_name}"
end
