require 'config/environment.rb'

task :magazzino do

models = Model.all(:select => 'id, name, maker_id')

ary = [
"Marchio",
"Adidas",
"Agatha Cruiz De La Prada",
"Alain Mikli",
"Alek Paul",
"Alviero Martini",
"Are Com",
"Arnette",
"Benetton",
"biblos",
"Bikkembergs",
"Black",
"Blasco",
"Bulgari",
"Carrera",
"Cartier",
"Chanel",
"Charmant",
"Chopard",
"Clark",
"Como Baby",
"Cops",
"D&G",
"Daytona",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Dsquared2",
"Emporio Armani",
"Esprit",
"Etnia",
"Etro",
"Exalt Cycle",
"Exess",
"Exte",
"Fendi",
"Ferragamo",
"Ferre",
"Gabry",
"Genny",
"Gianluca Darril",
"Giorgio Armani",
"Gucci",
"Hoseki",
"Hugo Boss",
"Ic Berlin",
"Imatra",
"Jil Sander",
"John Richmond",
"Just Cavalli",
"Kata",
"Kyo Yamato Titanium",
"Le Club",
"Lindberg",
"Link",
"Loewe",
"Luxottica",
"m/m",
"Mariella Burani",
"Mauijim",
"Max Mara",
"Michael Kors",
"Miss Sixty",
"Miu Miu",
"Mogan",
"Munich Eyewear",
"Nike Sole",
"Nike Vista",
"Niko",
"North Face",
"Oakley",
"Okki",
"Olivieri Studio",
"Original Marines",
"Oxydo",
"Patty",
"Persol",
"Pirelli",
"Polaroid",
"Police",
"Polo Ralph Lauren",
"Porsche",
"Prada",
"Quemme",
"Ralph Lauren",
"Range Rover",
"Ray Ban",
"Red Rose",
"Replay",
"Revo",
"Roberto Cavalli",
"Rolling",
"Romeo Gigli",
"Roy Tower",
"Sergio Tacchini",
"Seventh Street",
"Silhouette",
"Smith Optics",
"Starck Eyes",
"Steffan Preutz",
"Sting & Yamamay",
"Swarovski ",
"Sweet Years",
"T3",
"Tag Heuer",
"T-Force",
"Tiffany&co",
"Timberland",
"Tod's",
"Tom Ford",
"Top Line",
"Trudi",
"Try",
"Valentino",
"Valmax",
"Vanni",
"Vogart",
"Vogue",
"Web",
"Winx",
"X-Ice",
"Yamamoto",
"Yves Saint Laurent",
"Zeroh++",
"Action Man",
"Adidas",
"Air Titanium",
"Alain Mikli",
"Alexander Mc Queen",
"Alviero Martini",
"Anna Sui",
"Anne Klein",
"Aristar",
"Barbie",
"Bellinger",
"Benetton",
"biblos",
"Blue Bay",
"Blumarine",
"Bottega Veneta",
"Brooks Brothers",
"Bulgari",
"Burberry",
"Calvin Klein",
"Carrera",
"Cartier",
"Celine Lunettes",
"Chanel",
"Charmant",
"Chopard",
"CK",
"Como Baby",
"Como Baby",
"Cops",
"Costume National",
"Cp Company",
"D&G",
"De Rigo",
"Desil",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Domina-Gould",
"Dsquared2",
"Dunhill",
"Emilio Pucci",
"Emporio Armani",
"Etro",
"Exalt Cycle",
"Fendi",
"Ferragamo",
"Ferrari",
"Ferre",
"Fischer Price",
"Flair",
"Frankie Morello",
"Fysh",
"G.M. Venturi",
"Gai Mattiolo",
"Genny",
"Gianluca Darril",
"Giorgio Armani",
"Givenchy",
"Gucci",
"Guess",
"Harley Davidson",
"Harry Potter",
"Hello Kitty",
"Hugo Boss",
"I Cristalli",
"Iceberg",
"Idc",
"Imatra",
"Infinity",
"Jean Paul Gaultier",
"Jil Sander",
"John Richmond",
"Just Cavalli",
"Koali",
"L.A. Eyeworks",
"La Perla",
"LaRos.it",
"Le Club Actif",
"Les Copains",
"Loewe",
"Looney Tunes",
"Luxottica",
"m/m",
"Marc Jacobs",
"Marni",
"Martini Racing",
"Mauijim",
"Max Mara",
"Mercedes-Benz",
"Miss Sixty",
"Missoni",
"Miu Miu",
"Mont Blanc",
"Moschino",
"Oakley",
"Oliver",
"Olivieri Studio",
"O-Six",
"Oxydo",
"Persol",
"Polaroid",
"Police",
"Polo Ralph Lauren",
"Porsche",
"Prada",
"Ralph Lauren",
"Ray Ban",
"Red Rose",
"Reebok",
"Replay",
"Revo",
"Rim",
"Roberta Di Camerino",
"Roberto Cavalli",
"Rodenstock",
"Safilo",
"Seiko",
"Sergio Tacchini",
"Seventh Street",
"Sferoflex",
"Silhouette",
"Sisley",
"Sonia Rykiel",
"Sting & Yamamay",
"Sun Jet",
"Superga",
"Swarovski ",
"Tag Heuer",
"Tod's",
"Tom Ford",
"Trudi",
"Trussardi",
"Try",
"Turn & Flex",
"Turtles",
"Uvex",
"Valentino",
"Vanni",
"Versace",
"Versus",
"Village",
"Viu-In",
"Vogart",
"Vogue",
"Web",
"Yves Cogan",
"Yves Saint Laurent",
"Ziel",
"Action Man",
"Adidas",
"Agatha Cruiz De La Prada",
"Air Titanium",
"Alain Mikli",
"Alek Paul",
"Alpina",
"Alviero Martini",
"Arnette",
"Balenciaga",
"Barbie",
"Bellinger",
"Benetton",
"Bikkembergs",
"Black",
"Bottega Veneta",
"Boucheron",
"Bulgari",
"Calvin Klein",
"Carrera",
"Cartier",
"Chanel",
"Charmant",
"Ck",
"Clark",
"Clic",
"Coliseum",
"Creattivi Attivi",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Dsquared2",
"Emilio Pucci",
"Emporio Armani",
"Enfasi",
"Esprit",
"Etnia",
"Etro",
"Exalt Cycle",
"Exess",
"Exte",
"Fendi",
"Ferragamo",
"Ferre",
"Fischer Price",
"Flair",
"Gabry",
"Gianluca Darril",
"Gioielli",
"Giorgio Armani",
"Goold & Wood",
"Gotti",
"Gucci",
"Hello Kitty",
"Hugo Boss",
"Ic Berlin",
"Infinity",
"jeckerson",
"Jil Sander",
"Jo Jo",
"John Richmond",
"Just Cavalli",
"Kata",
"Koali",
"L.A. Eyeworks",
"LaFont",
"Lightouch",
"Lindberg",
"Link",
"Lotto",
"Luxottica",
"m/m",
"Marc Jacobs",
"Max Mara",
"Michael Kors",
"Momo",
"Mont Blanc",
"Mur Mur",
"niko3",
"Nodoka",
"Oakley",
"Okki",
"Original Marines",
"Ostavi",
"Oxydo",
"Persol",
"Police",
"Porsche",
"Prada",
"Quemme",
"Ralph Lauren",
"Ray Ban",
"Replay",
"Revo",
"Roberto Cavalli",
"Safilo",
"Seiko",
"Seventh Street",
"Sferoflex",
"Silhouette",
"Starck Eyes",
"Sweet Years",
"Tag Heuer",
"Tom Ford",
"Try",
"Valentino",
"Valmax",
"Vanni",
"Virtus",
"Viu-In",
"Vogue",
"Vuarnet",
"Winx",
"X-Ice",
"Yves Saint Laurent",
"Zeiss",
"Zeroh++",
"Zio",
"Action Man",
"Adidas",
"Alain Mikli",
"Alek Paul",
"Arnette",
"Barbie",
"Bellinger",
"Benetton",
"biblos",
"Bottega Veneta",
"Brooks Brothers",
"Bulgari",
"Calvin Klein",
"Carrera",
"Cartier",
"Chanel",
"Chopard",
"CK",
"Colors",
"Como Baby",
"Como Baby",
"Costume National",
"D&G",
"Desk",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Dunhill",
"Emporio Armani",
"Escada",
"Etro",
"Exalt Cycle",
"Exte",
"Eye!Dc",
"Fendi",
"Ferragamo",
"Ferre",
"Genny",
"Gianluca Darril",
"Giorgio Armani",
"Gucci",
"Hugo Boss",
"Ic Berlin",
"Idc",
"Italia Independent",
"Jil Sander",
"John Richmond",
"Karol Kent",
"Kata",
"Kirk",
"L.A. Eyeworks",
"Lafont",
"Les Copains",
"Link",
"Loewe",
"m/m",
"Marc Jacobs",
"Marni",
"Max Mara",
"Mercedes-Benz",
"Michael Kors",
"Mikita",
"Minima",
"Miss Sixty",
"Miu Miu",
"Moschino",
"Munich Eyewear",
"Nike Sole",
"Nike Vista",
"Oakley",
"Okky Factory",
"Oliver",
"Oxydo",
"Persol",
"Polaroid",
"Police",
"Pollini",
"Polo Ralph Lauren",
"Porsche",
"Prada",
"Pro design",
"Ralph Lauren",
"Ray Ban",
"Red Rose",
"Revo",
"Roberto Cavalli",
"Rolf Rudiger",
"Romeo Gigli",
"Roth",
"Safilo",
"Seventh Street",
"Silhouette",
"Slemme",
"Sonia Rykiel",
"Spirit",
"Starck Eyes",
"Stella Mc Carteney",
"Swarovski ",
"Tag Heuer",
"Tom Ford",
"Try",
"Urban",
"Valentino",
"Vanessa & Mehdi",
"Vanni",
"Versace",
"Versus",
"Viu-In",
"Vogue",
"Web",
"Yves Cogan",
"Yves Saint Laurent",
"Zenka",
"Action Man",
"Adidas",
"Agatha Cruiz De La Prada",
"Alain Mikli",
"Alpina",
"Anna Sui",
"Aristar",
"Barbie",
"Bellinger",
"Benetton",
"Bet",
"Bis & Corius",
"Blue Bay",
"Brillen Haar",
"ByWP",
"Calvin Klein",
"Carrera",
"Chanel",
"CK",
"D&G",
"Diesel",
"Dior",
"Disney",
"Dunhill",
"Elasta",
"Em Eyewear",
"Emanuel Ungaro",
"Emilio Pucci",
"Emporio Armani",
"Etnia",
"Etro",
"Exalt Cycle",
"Exte",
"Eye!Dc",
"Fantasy",
"Fendi",
"Ferre",
"Fischer Price",
"Gianluca Darril",
"Giorgio Armani",
"Gucci",
"Guess",
"Hello Kitty",
"Hugo Boss",
"Imatra",
"Ipotesi",
"John Richmond",
"Just Cavalli",
"Koali",
"La Perla",
"Lightec",
"Link",
"Luxottica",
"m/m",
"Magic Clip",
"Marc Jacobs",
"Max Mara",
"Miu Miu",
"Momo",
"Nike Sole",
"Nike Vista",
"Niko3",
"Oakley",
"Occhiali di Grazia",
"Oga",
"Oliver",
"Onyx",
"O-Six",
"Oxydo",
"Persol",
"Pierre Cardin",
"Pirelli",
"Police",
"Polo Ralph Lauren",
"Prada",
"Pro design",
"Quemme",
"Ralph Lauren",
"Ray Ban",
"Red Rose",
"Replay",
"Romeo Gigli",
"Safilo",
"Seventh Street",
"Sferoflex",
"Silhouette",
"Sisley",
"Stella Mc Carteney",
"Teletubbies",
"Try",
"Turn & Flex",
"Valentino",
"Vanni",
"Versace",
"Vogue",
"Web",
"X-Ice",
"Yves Saint Laurent",
"Zeroh++",
"Adidas",
"Agatha Cruiz De La Prada",
"Air",
"Air Titanium",
"Alain Mikli",
"Alek Paul",
"Alviero Martini",
"Bellinger",
"Benetton",
"Blumarine",
"Boucheron",
"Bulgari",
"Burberry",
"Calvin Klein",
"Carrera",
"Cartier",
"Cerruti",
"Chanel",
"CK",
"Como Baby",
"D&G",
"Desil",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Domina-Gould",
"Emporio Armani",
"Etro",
"Exte",
"Eye!Dc",
"Fendi",
"Ferragamo",
"Ferre",
"Fisch",
"Frankie Morello",
"Gianluca Darril",
"Giorgio Armani",
"Givenchy",
"Gucci",
"Guess",
"Hugo Boss",
"Idc",
"John Richmond",
"Just Cavalli",
"Kirk",
"Le Club Actif",
"Les Copains",
"Link",
"Luxottica",
"m/m",
"Mini",
"Missoni",
"Mont Blanc",
"Nike Sole",
"Oakley",
"Oxydo",
"P.Stark",
"Persol",
"Polaris",
"Polaroid",
"Polo Ralph Lauren",
"Porsche",
"Prada",
"Ray Ban",
"Replay",
"Revo",
"Roberto Cavalli",
"Rodenstock",
"Romeo Gigli",
"Safilo",
"Serengeti",
"Seventh Street",
"Sferoflex",
"Silhouette",
"Smith Optics",
"Superga",
"Swarovski ",
"Tag Heuer",
"Tiffany&co",
"Tom Ford",
"Try",
"Valentino",
"Vanni",
"Versace",
"Viu-In",
"Vogue",
"Web",
"Yves Saint Laurent",
"Zenka",
"Zeroh++",
"Zio",
"Action Man",
"Alain Mikli",
"Anna Hickmann",
"Benetton",
"Bikkembergs",
"Blumarine",
"Brillen Haar",
"Bulgari",
"Carrera",
"Cerruti",
"Chanel",
"Como Baby",
"D&G",
"Desil",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Dunhill",
"Emporio Armani",
"Etro",
"Exalt Cycle",
"Exte",
"Faconnable",
"Fendi",
"Ferre",
"Flair",
"Flexon Marchon",
"Gianluca Darril",
"Giorgio Armani",
"Gucci",
"Hugo Boss",
"John Richmond",
"La Perla",
"Lightec",
"Link",
"Lumen",
"m/m",
"Max Mara",
"Miss Sixty",
"Miu Miu",
"Mont Blanc",
"O-Six",
"Oxydo",
"Persol",
"Pierre Cardin",
"Polaroid",
"Polo Ralph Lauren",
"Prada",
"Ray Ban",
"Roberto Cavalli",
"Romeo Gigli",
"Safilo",
"Seiko",
"Seventh Street",
"Sferoflex",
"Silhouette",
"Sisley",
"Sting & Yamamay",
"Swarovski ",
"Sweet Years",
"Tom Ford",
"Trudi",
"Valentino",
"Versace",
"Vogue",
"Vuillet Vega",
"Yves Cogan",
"Zoogami",
"Action Man",
"Adidas",
"Agatha Cruiz De La Prada",
"Air Titanium",
"Alain Mikli",
"Alek Paul",
"Alpina",
"Alviero Martini",
"Arnette",
"Barbie",
"Bellinger",
"Benetton",
"biblos",
"Bioeyes",
"Blackfin",
"Blujo",
"Bolle",
"Boucheron",
"Briko",
"Brooks Brothers",
"Bulgari",
"Burberry",
"CAI",
"Calvin Klein",
"Carrera",
"Cartier",
"Casanova",
"Celine Lunettes",
"Chanel",
"Charmant",
"Chloe",
"Chopard",
"Como Baby",
"Como Baby",
"Cops",
"Creattivi Attivi",
"D&G",
"Desil",
"Diesel",
"Dior",
"DKNY",
"Dolce e Gabbana",
"Domina-Gould",
"Dsquared2",
"Emanuel Ungaro",
"Emblema",
"Emilio Pucci",
"Emporio Armani",
"Escada",
"Esprit",
"Etro",
"Exalt Cycle",
"Exte",
"Eye!Dc",
"Fendi",
"Fendissime",
"Ferragamo",
"Ferrari",
"Ferre",
"Fischer Price",
"Fossil",
"Genny",
"Gianluca Darril",
"Giorgio Armani",
"Gucci",
"Guess",
"Harley Davidson",
"Hoseki",
"Hugo Boss",
"Iceberg",
"Imatra",
"Italia Independent",
"John Richmond",
"Just Cavalli",
"Kaos",
"La Matta",
"Laura Biagiotti",
"Le Club Actif",
"Link",
"Lotto",
"Luxottica",
"m/m",
"Mandarina Duck",
"MauiJim",
"Max & Co.",
"Max Mara",
"Miss Sixty",
"Missoni",
"Miu Miu",
"Moschino",
"Nike Sole",
"Oakley",
"OeX",
"Oliver",
"Original Marines",
"Oxydo",
"Persol",
"Pierre Cardin",
"Police",
"Pollini",
"Polo Ralph Lauren",
"Porsche",
"Prada",
"Ralph Lauren",
"Ray Ban",
"Red Rose",
"Replay",
"Revo",
"Roberto Cavalli",
"Rolling",
"Romeo Gigli",
"Rudi Project",
"Safilo",
"Seiko",
"Sergio Tacchini",
"Seventh Street",
"Sferoflex",
"Silhouette",
"Sisley",
"Sonia Rykiel",
"Sting & Yamamay",
"Swarovski ",
"Switch",
"Tag Heuer",
"Thema",
"Tod's",
"Tom Ford",
"Top Line",
"Trudi",
"Try",
"Turtles",
"Uvex",
"Valentino",
"Valmassoi",
"Vanni",
"Versace",
"Versus",
"Vogue",
"Web",
"X-Ice",
"Yves Saint Laurent",
"Zeiss",
"Zeroh++",
"Zoogami",
"Agatha Cruiz De La Prada",
"Alain Mikli",
"Alpina",
"Anne Et Valentin",
"Barbie",
"Bellinger",
"Benetton",
"biblos",
"Bikkembergs",
"Blasco",
"Bratz",
"Calvin Klein",
"Carrera",
"Chanel",
"CK",
"Como Baby",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Dsquared2",
"Emilio Pucci",
"Emporio Armani",
"Etro",
"Exalt Cycle",
"Fendi",
"Ferre",
"Fischer Price",
"Fish",
"Flair",
"Gianluca Darril",
"Giorgio Armani",
"Gucci",
"Harry Potter",
"Hot Wheels",
"Hugo Boss",
"Imatra",
"John Richmond",
"Just Cavalli",
"Kata",
"Lafont",
"Lightec",
"Link",
"m/m",
"MauiJim",
"Max Mara",
"Mercedes-Benz",
"Michael Kors",
"Modo",
"Munich Eyewear",
"Nike Sole",
"Niko3",
"O-Six",
"Oxydo",
"Persol",
"Polaris",
"Polaroid",
"Police",
"Polo Ralph Lauren",
"Prada",
"Quemme",
"Ray Ban",
"Ray Ban",
"Replay",
"Revo",
"Roberto Cavalli",
"Safilo",
"Seiko",
"Seventh Street",
"Silhouette",
"Sweet Years",
"Teletubbies",
"Tom Ford",
"Top Line",
"Try",
"Uvex",
"Valentino",
"Vanni",
"Versace",
"Vogue",
"Web",
"X-Ice",
"Zeiss",
"Action Man",
"Adidas",
"Agatha Cruiz De La Prada",
"Air",
"Alain Mikli",
"Alviero Martini",
"Anna Sui",
"Anne Et Valentin",
"Arnette",
"Balenciaga",
"Barbie",
"Bellinger",
"Benetton",
"biblos",
"Black",
"Blue Bay",
"Blu-Jo",
"Bolle",
"Bottega Veneta",
"Bratz",
"Briko",
"Brooks Brothers",
"Bulgari",
"Burberry",
"Calvin Klein",
"Carrera",
"Cartier",
"Celine Lunettes",
"Chanel",
"Chopard",
"CK",
"Costume National",
"D&G",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Dsquared2",
"Em Eyewear",
"Emilio Pucci",
"Emporio Armani",
"Etro",
"Exalt Cycle",
"Exte",
"Eyeworks",
"Fendi",
"Ferragamo",
"Ferre",
"Fornarina",
"Genny",
"Gianluca Darril",
"Giorgio Armani",
"Gold & Wood",
"Gucci",
"Guess",
"Harry Potter",
"HKBC",
"Hoseki",
"Hugo Boss",
"Histoire De Voir",
"Ic Berlin",
"Infinity",
"Jean Paul Gaultier",
"Jil Sander",
"Killer Loop",
"La Font",
"La Perla",
"Le Club Actif",
"Link",
"Loewe",
"Luxottica",
"m/m",
"Marc Jacobs",
"Max Mara",
"Missoni",
"Miu Miu",
"Modo",
"Moschino",
"Nautica",
"Nike Sole",
"Oakley",
"Oliver",
"Oxydo",
"Persol",
"Pirelli",
"Polaroid",
"Police",
"Polo Ralph Lauren",
"Porsche",
"Prada",
"Ray Ban",
"Red Rose",
"Replay",
"Revo",
"Roberto Cavalli",
"Rodenstock",
"Rolling",
"Romeo Gigli",
"Safilo",
"Saki",
"Seiko",
"Sergio Tacchini",
"Seventh Street",
"Silhouette",
"Starck Eyes",
"Sting & Yamamay",
"Swarovski ",
"Teletubbies",
"T-Force",
"Tod's",
"Tom Ford",
"Trussardi",
"Ungaro",
"Valentino",
"Vanessa & Mehdi",
"Versace",
"Village",
"Viu-In",
"Vogue",
"Web",
"Yves Saint Laurent",
"Zeroh++",
"Action Man",
"Adidas",
"Agatha Cruiz De La Prada",
"Air",
"Alain Mikli",
"Alpina",
"Arnette",
"Balenciaga",
"Barbie",
"Benetton",
"Blue Bay",
"Bottega Veneta",
"Bulgari",
"Burberry",
"Carrera",
"Cartier",
"Cebe",
"Celine Lunettes",
"Chanel",
"Chloe",
"Chopard",
"CK",
"Como Baby",
"Costume National",
"D&G",
"Diesel",
"Dior",
"Dolce e Gabbana",
"Dsquared2",
"Dunhill",
"Emilio Pucci",
"Emporio Armani",
"Etro",
"Exte",
"Fabien Borok",
"Fendi",
"Ferre",
"Flair",
"Fysh",
"Genny",
"Gianluca Darril",
"Giorgio Armani",
"Gotti",
"Gucci",
"Hugo Boss",
"Iceberg",
"Imatra",
"Infinity",
"Jil Sander",
"John Richmond",
"Just Cavalli",
"Kaos",
"Koali",
"Kyo Yamato Titanium",
"La Matta",
"La Perla",
"Lightec",
"Link",
"Loewe",
"Lotto",
"Lozza",
"m/m",
"Max Mara",
"Michael Kors",
"Minima",
"Miu Miu",
"Mont Blanc",
"Moschino",
"Nike Sole",
"Oakley",
"Oliver",
"Osyx",
"Oxydo",
"P.Stark",
"Persol",
"Play Boy",
"Playlife",
"Polaroid",
"Police",
"Polo Ralph Lauren",
"Porsche",
"Prada",
"Ralph Lauren",
"Ray Ban",
"Red Rose",
"Replay",
"Revo",
"Roberto Cavalli",
"Rodenstock",
"Romeo Gigli",
"S. Rikiel",
"Safilo",
"Seiko",
"Serengeti",
"Sergio Tacchini",
"Seventh Street",
"Sferoflex",
"Silhouette",
"Sisley",
"Slight",
"Starck Eyes",
"Stella Mc Carteney",
"Sting & Yamamay",
"Swarovski ",
"Tod's",
"Tom Ford",
"Trudi",
"Try Change",
"Try frames",
"Turtles",
"Uvex",
"Valentino",
"Versace",
"Vogue",
"Web",
"X-Ice",
"You's",
"Yves Saint Laurent",
"Zenka",
"Zeroh++",
"Ziel",
"Zio"]

ary.each do |m|
 model = models.select{|el| el.name.downcase.include?(m.downcase[0,m.length-1])}
 puts model.empty? ? m : model.first.maker_id
end

end