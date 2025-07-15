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
  { name: "1000", image: "1000.png"},
  { name: "Giro", image: "giro.png"},
  { name: "Dragon", image: "dragon.png"},
  { name: "Sweet Protection", image: "sweetprotection.png"},
  { name: "Dope Snow", image: "dope.png"}
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
  { first_name: "Andri", last_name: "Ragettli", nationality: "Switzerland", date_of_birth: "1998-08-21", home_resort: "Laax", image: "andriragettli.jpeg", gear_sponsor: "Vökl", bio: "Andri is one of the most decorated freestyle skiers of his generation, with multiple FIS Crystal Globes and World Cup victories in both slopestyle and big air. Known for pushing the boundaries of technical progression, he was the first skier to land a quad cork 1800 and is recognized for his clean style and massive trick variety." },
  { first_name: "Alex", last_name: "Hall", nationality: "United States", date_of_birth: "1998-09-21", home_resort: "Park City, Utah", image: "alexhall.jpg", gear_sponsor: "Faction", bio: "A standout in slopestyle and big air, Alex is known for his unmatched creativity, flowing lines, and signature grabs. He’s earned multiple X Games medals and podiums at World Championships and World Cups, consistently standing out for his unique approach and trick execution." },
  { first_name: "Luca", last_name: "Harrington", nationality: "New Zealand", date_of_birth: "2004-02-19", home_resort: "Cardrona Alpine Resort", image: "lucaharrington.jpg", gear_sponsor: "Vökl", bio: "Luca is a rising star in freestyle skiing, quickly gaining attention for his smooth park style and technical spins. Though early in his career, he’s already made finals appearances on the World Cup circuit and is known for his rail precision and stylish flow." },
  { first_name: "Mac", last_name: "Forehand", nationality: "United States", date_of_birth: "2001-08-04", home_resort: "Stratton Mountain, Vermont", image: "macforehand.jpeg", gear_sponsor: "Faction", bio: "Mac blends powerful airs with effortless rail style, making him a frequent podium contender in slopestyle and big air. He secured silver at the 2025 World Championships and continues to impress with his amplitude and trick consistency." },
  { first_name: "Tormod", last_name: "Frostad", nationality: "Norway", date_of_birth: "2002-08-29", home_resort: "Sandvika", image: "tormodfrostad.jpg", gear_sponsor: "Faction", bio: "Tormod brings a clean, calculated style to slopestyle courses, with a knack for well-balanced spins and confident rail work. A consistent World Cup finalist, he is known for his control and fluidity in competition."},
  { first_name: "Matej", last_name: "Svancer", nationality: "Austria", date_of_birth: "2004-03-26", home_resort: "Kaprun", image: "matejsvancer.jpg", gear_sponsor: "Faction", bio: "Matej is known for his explosive style and big trick ambition. With standout performances in the World Cup and a history of throwing never-before-seen combos, he’s recognized for pushing park skiing to new creative levels." },
  # # { first_name: "Henry", last_name: "Sildaru", nationality: "Estonia", date_of_birth: "2006-08-26", home_resort: "Tallin, Estonia" },
  # # { first_name: "Dylan", last_name: "Deschamps", nationality: "Canada", date_of_birth: "2002-12-12", home_resort: "Québec, QC" },
  { first_name: "Birk", last_name: "Ruud", nationality: "Norway", date_of_birth: "2000-04-02", home_resort: "Kirkerud", image: "birkruud.jpeg", gear_sponsor: "Vökl", bio: "The founder of Busi and a dominant force in both slopestyle and big air, with World Championship gold and multiple World Cup titles under his belt. His skiing is powerful and smooth, combining massive amplitude with technical precision and a fearless competitive mindset."  },
  # # { first_name: "Elias", last_name: "Syrjä", nationality: "Finland", date_of_birth: "1998-08-28", home_resort: "-" },
  { first_name: "Max", last_name: "Moffatt", nationality: "Canada", date_of_birth: "1998-06-27", home_resort: "Calgary", image: "maxmoffatt.jpeg", gear_sponsor: "Armada", bio: "Max stands out for his creative lines and stylish rail tricks. A regular top competitor on the World Cup scene, he blends fluid switch skiing and distinctive grabs into a polished, modern park aesthetic." },
  { first_name: "Colby", last_name: "Stevenson", nationality: "United States", date_of_birth: "1997-10-03", home_resort: "Park City, Utah", image: "colbystevenson.jpeg", gear_sponsor: "K2", bio: "Colby rose to prominence with a breakout season in 2020 and has remained at the top ever since. Known for his technical consistency and smooth execution, he brings a composed, professional approach to every slopestyle and big air run." },
  # { first_name: "Miro", last_name: "Tabanelli", nationality: "Italy", date_of_birth: "2004-11-17", home_resort: "-" },
  { first_name: "Jesper", last_name: "Tjäder", nationality: "Sweden", date_of_birth: "1994-05-22", home_resort: "Åre", image: "jespertjader.jpg", gear_sponsor: "Head", bio: "Jesper is one of the most innovative skiers in the world, known for his experimental tricks and mind-bending rail features. A World Cup regular and viral video icon, he’s constantly reinventing what’s possible in freestyle skiing."},
  { first_name: "Ferdinand", last_name: "Dahl", nationality: "Norway", date_of_birth: "1998-07-17", home_resort: "Oslo", image: "ferdinanddahl.jpg", gear_sponsor: "Vishnu", bio: "Ferdinand combines laid-back style with high-level technical skills, creating one of the most watchable runs in competition. He’s known for creative spins and seamless rail transitions, and has medaled at major international events. He is the founder of Capeesh" },
  { first_name: "Henrik", last_name: "Harlaut", nationality: "Sweden", date_of_birth: "1991-08-14", home_resort: "Åre", image: "henrikharlaut.jpg", gear_sponsor: "Armada", bio: "A freestyle legend, Henrik is celebrated for his signature steeze, unique grabs, and dominant X Games performances. With multiple gold medals and unforgettable runs, his skiing blends creativity, expression, and deep trick knowledge." },
  { first_name: "Candide", last_name: "Thovex", nationality: "France", date_of_birth: "1982-05-22", home_resort: "La Clusaz", image: "candidethovex.jpeg", gear_sponsor: "Candide", bio: "Candide is a pioneering icon in freeskiing, with a legacy that includes X Games golds, a Freeride World Tour title, and genre-defining film parts. Known for his effortless control and unmatched creativity, he redefined what was possible both in competition and in backcountry filmmaking." }
]

clothing = {
  "Andri Ragettli"  => ["ELHO Freestyle", "Vökl", "Marker",],
  "Alex Hall"       => ["Moncler", "Faction", "Dragon"],
  "Luca Harrington" => ["Spyder", "Jiberish", "Vökl", "Oakley"],
  "Mac Forehand"    => ["Oakley", "Spyder", "Faction"],
  "Tormod Frostad"  => ["Capeesh", "Oakley", "Faction"],
  "Matej Svancer"   => ["Capeesh", "Harlaut Apparel", "Faction", "Oakley"],
  "Birk Ruud"       => ["BUSI Company", "Capeesh", "Vökl", "Oakley"],
  "Max Moffatt"     => ["Oakley", "Armada", "Giro"],
  "Colby Stevenson" => ["Oakley", "K2"],
  "Jesper Tjäder"   => ["Head", "Sweet Protection", "Dope Snow"],
  "Ferdinand Dahl"  => ["Capeesh", "Vishnu"],
  "Henrik Harlaut"  => ["Harlaut Apparel", "Armada"],
  "Candide Thovex"  => ["Candide"]
}


athletes.each do |athlete_data|
  athlete = Athlete.create(first_name: athlete_data[:first_name], last_name: athlete_data[:last_name], nationality: athlete_data[:nationality], date_of_birth: athlete_data[:date_of_birth], home_resort: athlete_data[:home_resort], gear_sponsor: athlete_data[:gear_sponsor], bio: athlete_data[:bio])

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

