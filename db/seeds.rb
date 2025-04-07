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
  { first_name: "Andri", last_name: "Ragettli", nationality: "Switzerland", date_of_birth: "1998-08-21", home_resort: "Laax, Switzerland" },
  { first_name: "Alex", last_name: "Hall", nationality: "United States", date_of_birth: "1998-09-21", home_resort: "Park City, Utah" },
  { first_name: "Luca", last_name: "Harrington", nationality: "New Zealand", date_of_birth: "2004-02-19", home_resort: "Cardrona Alpine Resort" },
  { first_name: "Mac", last_name: "Forehand", nationality: "United States", date_of_birth: "2001-08-04", home_resort: "Stratton Mountain, Vermont" },
  { first_name: "Tormod", last_name: "Frostad", nationality: "Norway", date_of_birth: "2002-08-29", home_resort: "Sandvika, Norway" },
  { first_name: "Matej", last_name: "Svancer", nationality: "Austria", date_of_birth: "2004-03-26", home_resort: "Kaprun, Austria" },
  { first_name: "Henry", last_name: "Sildaru", nationality: "Estonia", date_of_birth: "2006-08-26", home_resort: "Tallin, Estonia" },
  { first_name: "Dylan", last_name: "Deschamps", nationality: "Canada", date_of_birth: "2002-12-12", home_resort: "Québec, QC" },
  { first_name: "Birk", last_name: "Ruud", nationality: "Norway", date_of_birth: "2000-04-02", home_resort: "Kirkerud, Norway" },
  { first_name: "Elias", last_name: "Syrjä", nationality: "Finland", date_of_birth: "1998-08-28", home_resort: "-" },
  { first_name: "Max", last_name: "Moffatt", nationality: "Canada", date_of_birth: "1998-06-27", home_resort: "Calgary, Canada" },
  { first_name: "Colby", last_name: "Stevenson", nationality: "United States", date_of_birth: "1997-10-03", home_resort: "Park City, Utah" },
  { first_name: "Miro", last_name: "Tabanelli", nationality: "Italy", date_of_birth: "2004-11-17", home_resort: "-" },
  { first_name: "Jesper", last_name: "Tjäder", nationality: "Sweden", date_of_birth: "1994-05-22", home_resort: "Åre, Sweden" },
  { first_name: "Ferdinand", last_name: "Dahl", nationality: "Norway", date_of_birth: "1998-07-17", home_resort: "Oslo, Norway" },
  { first_name: "Ferdinand", last_name: "Dahl", nationality: "Norway", date_of_birth: "1998-07-17", home_resort: "Oslo, Norway" },
]

athletes.each do |athlete_data|
  athlete = Athlete.create(first_name: athlete_data[:first_name], last_name: athlete_data[:last_name], nationality: athlete_data[:nationality], date_of_birth: athlete_data[:date_of_birth], home_resort: athlete_data[:home_resort])

  puts "Created #{athlete.first_name} #{athlete.last_name}"
end
