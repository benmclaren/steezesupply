# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AthleteBrand.destroy_all
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
  { name: "NinetyRoll", image: "ninetyroll.png" },
  { name: "Candide", image: "candide.png" },
  { name: "Faction", image: "faction.png"},
  { name: "Armada", image: "armada.png"},
  { name: "Vökl", image: "vökl.png"},
  { name: "Vishnu", image: "vishnu.png"},
  { name: "K2", image: "k2.png"},
  { name: "Head", image: "head.png"},
  { name: "Moncler", image: "moncler.png"},
  { name: "ON3P", image: "on3p.png"},
  { name: "Marker", image: "marker.png"},
  { name: "Tyrolia", image: "tyrolia.png"},
  { name: "Smith", image: "smith.png"},
  { name: "Line", image: "line.png"},
  { name: "Atomic", image: "atomic.png"},
  { name: "100%", image: "100percent.png"},
  { name: "1000", image: "1000.png"}
]

brand_records = {}

brands.each do |brand_data|
  brand = Brand.create(name: brand_data[:name])
  
  # Attach image from local assets
  brand.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/brands/#{brand_data[:image]}")),
    filename: brand_data[:image],
    content_type: "image/jpeg"
  )

  brand_records[brand_data[:name]] = brand
  puts "Created #{brand.name} with image #{brand_data[:image]}"
end

Athlete.destroy_all
puts "all athletes destroyed"

athletes = [
  { first_name: "Andri", last_name: "Ragettli", nationality: "Switzerland", date_of_birth: "1998-08-21", home_resort: "Laax, Switzerland", image: "andriragettli.jpeg", gear_sponsor: "Vökl" },
  { first_name: "Alex", last_name: "Hall", nationality: "United States", date_of_birth: "1998-09-21", home_resort: "Park City, Utah", image: "alexhall.jpg", gear_sponsor: "Faction" },
  { first_name: "Luca", last_name: "Harrington", nationality: "New Zealand", date_of_birth: "2004-02-19", home_resort: "Cardrona Alpine Resort", image: "lucaharrington.jpg", gear_sponsor: "Vökl" },
  { first_name: "Mac", last_name: "Forehand", nationality: "United States", date_of_birth: "2001-08-04", home_resort: "Stratton Mountain, Vermont", image: "macforehand.jpeg", gear_sponsor: "Faction" },
  { first_name: "Tormod", last_name: "Frostad", nationality: "Norway", date_of_birth: "2002-08-29", home_resort: "Sandvika, Norway", image: "tormodfrostad.jpg", gear_sponsor: "Faction" },
  { first_name: "Matej", last_name: "Svancer", nationality: "Austria", date_of_birth: "2004-03-26", home_resort: "Kaprun, Austria", image: "matejsvancer.jpg", gear_sponsor: "Faction" },
  # # { first_name: "Henry", last_name: "Sildaru", nationality: "Estonia", date_of_birth: "2006-08-26", home_resort: "Tallin, Estonia" },
  # # { first_name: "Dylan", last_name: "Deschamps", nationality: "Canada", date_of_birth: "2002-12-12", home_resort: "Québec, QC" },
  { first_name: "Birk", last_name: "Ruud", nationality: "Norway", date_of_birth: "2000-04-02", home_resort: "Kirkerud, Norway", image: "birkruud.jpeg", gear_sponsor: "Vökl" },
  # # { first_name: "Elias", last_name: "Syrjä", nationality: "Finland", date_of_birth: "1998-08-28", home_resort: "-" },
  { first_name: "Max", last_name: "Moffatt", nationality: "Canada", date_of_birth: "1998-06-27", home_resort: "Calgary, Canada", image: "maxmoffatt.jpeg", gear_sponsor: "Armada" },
  { first_name: "Colby", last_name: "Stevenson", nationality: "United States", date_of_birth: "1997-10-03", home_resort: "Park City, Utah", image: "colbystevenson.jpeg", gear_sponsor: "K2" },
  # { first_name: "Miro", last_name: "Tabanelli", nationality: "Italy", date_of_birth: "2004-11-17", home_resort: "-" },
  { first_name: "Jesper", last_name: "Tjäder", nationality: "Sweden", date_of_birth: "1994-05-22", home_resort: "Åre, Sweden", image: "jespertjader.jpg", gear_sponsor: "Head" },
  { first_name: "Ferdinand", last_name: "Dahl", nationality: "Norway", date_of_birth: "1998-07-17", home_resort: "Oslo, Norway", image: "ferdinanddahl.jpg", gear_sponsor: "Vishnu" },
  { first_name: "Henrik", last_name: "Harlaut", nationality: "Sweden", date_of_birth: "1991-08-14", home_resort: "Åre, Sweden", image: "henrikharlaut.jpg", gear_sponsor: "Armada" },
  { first_name: "Candide", last_name: "Thovex", nationality: "France", date_of_birth: "1982-05-22", home_resort: "La Clusaz, France", image: "candidethovex.jpeg", gear_sponsor: "Candide" }
]

clothing = {
  "Andri Ragettli"  => ["ELHO Freestyle"],
  "Alex Hall"       => ["Moncler"],
  "Luca Harrington" => ["Spyder", "Jiberish"],
  "Mac Forehand"    => ["Oakley", "Spyder"],
  "Tormod Frostad"  => ["Capeesh", "Oakley"],
  "Matej Svancer"   => ["Capeesh", "Harlaut Apparel"],
  "Birk Ruud"       => ["BUSI Company", "Capeesh"],
  "Max Moffatt"     => ["Oakley", "Armada"],
  "Colby Stevenson" => ["Oakley"],
  "Jesper Tjäder"   => [""],
  "Ferdinand Dahl"  => ["Capeesh"],
  "Henrik Harlaut"  => ["Harlaut Apparel"],
  "Candide Thovex"  => ["Candide"]
}


athletes.each do |athlete_data|
  athlete = Athlete.create(first_name: athlete_data[:first_name], last_name: athlete_data[:last_name], nationality: athlete_data[:nationality], date_of_birth: athlete_data[:date_of_birth], home_resort: athlete_data[:home_resort], gear_sponsor: athlete_data[:gear_sponsor])

  # Attach image from local assets
  athlete.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/athletes/#{athlete_data[:image]}")),
    filename: athlete_data[:image],
    content_type: "image/jpeg"
  )

  full_name = "#{athlete.first_name} #{athlete.last_name}"
  Array(clothing[full_name]).each do |brand_name|
    brand = brand_records[brand_name]
    athlete.brands << brand if brand && !athlete.brands.include?(brand)
  end


  puts "Created #{athlete.first_name} #{athlete.last_name} with image #{athlete_data[:image]}"
end

