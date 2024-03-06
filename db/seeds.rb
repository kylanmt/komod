# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Clothe.destroy_all
Transaction.destroy_all

antoine = User.new({ user_name: "Antoinette", first_name: "Antoine", last_name: "Dupont", email: "antoine.dupont@email.com", phone_number: "0723456789", address: "11 rue du Chateau, 44000, Nantes", password: "123456", ranking: 4 })
antoine.address = "18 Rue des Namnètes, 44840 Les Sorinières"
antoine.save!

kylan = User.new({ user_name: "Le Kycks", first_name: "Kylan", last_name: "Metzner", email: "kylan.metzner@email.com", phone_number: "0823456789", address: "15 rue du Bellevue, 44000, Nantes", password: "123456", ranking: 2 })
kylan.address = "18 All. du Vigneau, 44840 Les Sorinières"
kylan.save

oscar = User.new({ user_name: "Oscarabé", first_name: "Oscar", last_name: "Pessans", email: "oscar.pessans@email.com", phone_number: "0734567890", address: "9 rue de Lamoricière, 44000, Nantes", password: "123456", ranking: 3 })
oscar.address = "1 Rue des Charmilles, 44400 Rezé"
oscar.save

quentin = User.new({ user_name: "Quentintin", first_name: "Quentin", last_name: "Moussef", email: "quantin.moussef@email.com", phone_number: "0912345678", address: " 6 rue de la fosse aux lionn, 44000, Nantes", password: "123456", ranking: 3 })
quentin.address = "5 Imp. de la Volière, 44400 Rezé"
quentin.save

juliette = User.new({ user_name: "Juju", first_name: "Juliette", last_name: "Simon", email: "juliette.sion@email.com", phone_number: "0923456789", address: "36 boulevard Jean Leduc, 44300, Nantes", password: "123456", ranking: 5 })
juliette.address = "107 Rue du Château de Rezé, 44400 Rezé"
juliette.save

anna = User.new({ user_name: "Annana", first_name: "Anna", last_name: "Chelby", email: "anna.chelby@email.com", phone_number: "0634567890", address: "17 rue de la rivière, 44200, Nantes", password: "123456", ranking: 5 })
anna.address = "11 Rue Saint-Hermeland, 44200 Nantes"
anna.save

pauline = User.new({ user_name: "Paulinette", first_name: "Pauline", last_name: "Assoun", email: "pauline.assoune@email.com", phone_number: "0912345678", address: "5 rue du temple,44100 , Nantes", password: "123456", ranking: 5 })
pauline.address = "18 Rue Dobree, 44100 Nantes"
pauline.save

justine = User.new({ user_name: "Justiti", first_name: "Justine", last_name: "Assoun", email: "justine.assoun@email.com", phone_number: "0812345678", address: "95 ruelle du vieux chateau, 44300, Nantes", password: "123456", ranking: 4 })
justine.address = "9 Rue de la Marne, 44000 Nantes"
justine.save

emma = User.new({ user_name: "Emmy", first_name: "Emma", last_name: "Lecombe", email: "emma.lecobe@email.com", phone_number: "0712345678", address: "1 boulevard de la bonne espérence, 44000, Nantes", password: "123456", ranking: 3 })
emma.address = "10 Pass. Louis Lévesque, 44000 Nantes"
emma.save

ismael = User.new({ user_name: "Ismakan", first_name: "Ismael", last_name: "Tabyaoui", email: "ismael.tabyaoui@email.com", phone_number: "0612345678", address: "1 boulevard de la boulangerie, 44100, Nantes", password: "123456", ranking: 4})
ismael.address ="16 Rue Georges Clemenceau, 44000 Nantes"
ismael.save

users = User.all
users_ids = []
users.each do |user|
  users_ids << user.id
end

# CREATION DES VETEMENTS (SANS OWNER, CONDITION ET TAILLE ALEATOIRES )

sizes = %w[XS S M L XL XXL XXXL]
condition = ["bon état", "très bon état", "comme neuf"]

# template = Clothe.new({ name: "",
#                         description: "",
#                         size: sizes.sample,
#                         brand: "",
#                         category: "",
#                         value: "",
#                         available: true,
#                         condition: condition.sample })
# template.owner = User.all.sample
# template.save!

# POUR UNE IMAGE

# file = File.open(Rails.root.join("relative_path(click droit sur l'image)"))
# template.photos.attach(io: file, filename: "nom de l'image sans l'extension", content_type: "image/(extension)")

# POUR UN DOSSIER D'IMAGE

def attach_images_to_clothe(clothe)
  # LE NOM DU PREMIER SOUS-DOSSIER EST CELUI DE SA CATEGORIE
  clothe_category = clothe.category

  # LE NOM DU DEUXIEME SOUS-DOSSIER EST CELUI DU NOM DU VETEMENT EN MINUSCULE AVEC DES "_" A LA PLACE DES ESPACES
  clothe_name = clothe.name.parameterize(separator: '_')

  # JE FAIT LA ROUTE JUSQU'A L'IMAGE DANS LE DOSSIER SEED_IMAGE
  directory = "db/seed_images/#{clothe_category}/#{clothe_name}"

  # ITEREATION DANS LE DOSSIER ET ATTACHEMENT DES PHOTOS
  Dir.glob("#{directory}/*.{jpg,jpeg,png,gif}", base: Dir.pwd).each do |path|
    clothe.photos.attach(io: File.open(path), filename: File.basename(path))
  end
end

# attach_images_to_clothe(clothe)

# template.owner = User_name (ex: emma)
# template.save!

# pour antoine -> find . -name "*Zone.Identifier" -type f -delete

# CATEGORIE SKI

fusalp1 = Clothe.new({  name: "Veste Ski Fusalp Vintage Rouge",
                        description: "Idéale à porter avec un jean en mi saison. quelques défauts",
                        size: sizes.sample,
                        brand: "fusalp",
                        category: "ski",
                        value: "80",
                        available: true,
                        condition: condition.sample })
fusalp1.owner = User.all.sample
fusalp1.save!

fusalp2 = Clothe.new({  name: "Manteau Ski Fusalp Homme Noir",
                        description: "A servi qu’une semaine de ski, tiens très chaud en haute montagne et poche pour le forfait intégré.",
                        size: sizes.sample,
                        brand: "fulsalp",
                        category: "ski",
                        value: "200",
                        available: true,
                        condition: condition.sample })
fusalp2.owner = User.all.sample
fusalp2.save!

northface1 = Clothe.new({ name: "Manteau Ski The North Face Vert",
                          description: "Porté que 2 saisons dans les Alpes Françaises. Taille un peu grand et tiens très chaud en altitude !",
                          size: sizes.sample,
                          brand: "the north face",
                          category: "ski",
                          value: "140",
                          available: true,
                          condition: condition.sample })
northface1.owner = User.all.sample
northface1.save!

northface2 = Clothe.new({ name: "Pantalon Ski The North Face orange",
                          description: "serrage ceinture, ouvertures aération sur les cuisses. traces d'usures sur les chevilles.",
                          size: sizes.sample,
                          brand: "the north face",
                          category: "ski",
                          value: "50",
                          available: true,
                          condition: condition.sample })
northface2.owner = User.all.sample
northface2.save!

salomon1 = Clothe.new({ name: "Casque Ski Salomon Noir",
                        description: "couleur noir mat, a des rayures mais il n’y a jamais eu de chutes avec ! Accroche masque (cf photo).",
                        size: "XL",
                        brand: "salomon",
                        category: "ski",
                        value: "25",
                        available: true,
                        condition: condition.sample })
salomon1.owner = User.all.sample
salomon1.save!

salomon2 = Clothe.new({ name: "Pantalon Ski Salomon jaune ",
                        description: "Pantalon neuf couleur camel/moutarde foncée. Tiens chaud et attention taille grand même pour un XL !",
                        size: "XL",
                        brand: "salomon",
                        category: "ski",
                        value: "110",
                        available: true,
                        condition: condition.sample })
salomon2.owner = User.all.sample
salomon2.save!

# CATEGORIE ROBE
maje1 = Clothe.new({  name: "Robe asymétrique Maje",
                      description: "Robe Maje bleue. Le col est asymétrique et a effet drapé. ",
                      size: "S",
                      brand: "maje",
                      category: "robe",
                      value: "40",
                      available: true,
                      condition: condition.sample })
maje1.owner = User.all.sample
maje1.save!

maje2 = Clothe.new({  name: "Robe noire",
                      description: "Robe neuve avec étiquette en taille S. Cette robe provient d’une boutique MAJE et est noire avec des pois en matière style velours et petits strass brillant argentées avec des bretelles reliées par le logo dorée. Il y a une doublure et des ouvertures sur les côtés.  ",
                      size: sizes.sample,
                      brand: "maje",
                      category: "robe",
                      value: "80",
                      available: true,
                      condition: condition.sample })
maje2.owner = User.all.sample
maje2.save!

bash1 = Clothe.new({  name: "Robe Bash noire et dorée",
                      description: "Robe courte noire et dorée de chez Bash En parfait état  Parfaite pour une soirée ou un réveillon",
                      size: sizes.sample,
                      brand: "bash",
                      category: "robe",
                      value: "60",
                      available: true,
                      condition: condition.sample })
bash1.owner = User.all.sample
bash1.save!

bash2 = Clothe.new({  name: "Magnifique robe bash",
                      description: "Bonjour, Je fais un énorme tri dans dans nos dressings !n’hésitez pas à vous abonner ! :) Magnifique robe long Ba&sh. Longue style portefeuille, très agréable à porter et beau rendu à la marche puisque fluide. Je fais 1m70. Robe de soirée ou de tous les jours avec un perfecto et des Docs ;)  État neuf portée une fois.",
                      size: sizes.sample,
                      brand: "bash",
                      category: "robe",
                      value: "50",
                      available: true,
                      condition: condition.sample })
bash2.owner = User.all.sample
bash2.save!

valentino1 = Clothe.new({ name: "Robe de soirée rare Valentino",
                          description: "La robe est une taille 38 IT/ 36 FR et c'est comme neuf. Plus de photos en mp si demandé sans souci. Cette robe est parfaite pour une celebration de nouvel an ou un gala. 100% authentique",
                          size: sizes.sample,
                          brand: "valentino",
                          category: "robe",
                          value: "1000",
                          available: true,
                          condition: condition.sample })
valentino1.owner = User.all.sample
valentino1.save!

valentino2 = Clothe.new({ name: "Robe de soirée Valentino",
                          description: "Robe vintage Valentino en mélange de viscose, acétate et élasthanne. La longueur est de 150 cm, poitrine 42, taille 30, hanches 42. Je précise que la doublure intérieure a été préalablement raccourcie et je signale également quelques fils tirés près de l'étiquette et quelques marques en bas de la robe. A rafraîchir. En très bon état général.",
                          size: sizes.sample,
                          brand: "valentino",
                          category: "robe",
                          value: "850",
                          available: true,
                          condition: condition.sample })
valentino2.owner = User.all.sample
valentino2.save!

louis_vuitton1 = Clothe.new({ name: "Robe drapée Louis Vuitton",
                              description: "Couleur Champagne, en viscose souple, avec un joli détail en cordage sur le devant.",
                              size: sizes.sample,
                              brand: "louis vuitton",
                              category: "robe",
                              value: "450",
                              available: true,
                              condition: condition.sample })
louis_vuitton1.owner = User.all.sample
louis_vuitton1.save!

louis_vuitton2 = Clothe.new({ name: "Robe Louis Vuitton coupe ample",
                              description: "Robe élégante portée une fois",
                              size: sizes.sample,
                              brand: "louis vuitton",
                              category: "robe",
                              value: "700",
                              available: true,
                              condition: condition.sample })
louis_vuitton2.owner = User.all.sample
louis_vuitton2.save!

prada1 = Clothe.new({ name: "Robe élégante",
                      description: "Robe éléguante en soie avec plissé, taille petit , sans fermeture éclaire",
                      size: sizes.sample,
                      brand: "prada",
                      category: "robe",
                      value: "250",
                      available: true,
                      condition: condition.sample })
prada1.owner = User.all.sample
prada1.save!

prada2 = Clothe.new({ name: "Robe Prada",
                      description: "Robe texturé noire, avec des strass. ",
                      size: sizes.sample,
                      brand: "prada",
                      category: "robe",
                      value: "550",
                      available: true,
                      condition: condition.sample })
prada2.owner = User.all.sample
prada2.save!

# CATEGORIE PANTALON

wrangler1 = Clothe.new({  name: "Jean Wrangler bleu",
                          description: "pantalon work pants denim jean large charpentier carpenter baggy coupe droite hiver trousser france campagne street sport skate vieux old travail young vintage jolie soins rare grand american us usa etasunis Amérique fripe ville européen long unis motifs basique classe ",
                          size: sizes.sample,
                          brand: "wrangler",
                          category: "pantalon",
                          value: "10",
                          available: true,
                          condition: condition.sample })
wrangler1.owner = User.all.sample
wrangler1.save!

wrangler2 = Clothe.new({  name: "Jean Wrangler bleu clair",
                          description: "pantalon work pants denim jean large charpentier carpenter baggy coupe droite hiver trousser france campagne street sport skate vieux old travail young vintage jolie soins rare grand american us usa etasunis Amérique fripe ville européen long unis ",
                          size: sizes.sample,
                          brand: "wrangler",
                          category: "pantalon",
                          value: "8",
                          available: true,
                          condition: condition.sample })
wrangler2.owner = User.all.sample
wrangler2.save!

carhartt1 = Clothe.new({  name: "Pantalon Carhartt",
                          description: "Pantalon carhartt - usure normale taille 26 x 30",
                          size: sizes.sample,
                          brand: "carhartt",
                          category: "pantalon",
                          value: "15",
                          available: true,
                          condition: condition.sample })
carhartt1.owner = User.all.sample
carhartt1.save!

carhartt2 = Clothe.new({  name: "pantalon beige",
                          description: "taille bien",
                          size: sizes.sample,
                          brand: "carhartt",
                          category: "pantalon",
                          value: "20",
                          available: true,
                          condition: condition.sample })
carhartt2.owner = User.all.sample
carhartt2.save!

levis1 = Clothe.new({   name: "Jean Levis femme 524 too superlow",
                        description: "Explorez l'ultime révolution de la mode avec notre Jean Levis femme 524 Too Superlow, la pièce incontournable qui fusionne l'extravagance et le confort. Conçu pour les âmes audacieuses, ce jean incarne la définition même du style avant-gardiste.",
                        size: sizes.sample,
                        brand: "levis",
                        category: "pantalon",
                        value: "27",
                        available: true,
                        condition: condition.sample })
levis1.owner = User.all.sample
levis1.save!

levis2 = Clothe.new({   name: "Jean Levis",
                        description: "Jean légèrement usé vers le bas. Taille 34. Jean taille basse légèrement évasé.",
                        size: sizes.sample,
                        brand: "levis",
                        category: "pantalon",
                        value: "10",
                        available: true,
                        condition: condition.sample })
levis2.owner = User.all.sample
levis2.save!

sandro1 = Clothe.new({  name: "Pantalon Sandro Paris",
                        description: "Acheter sur Vinted taille 40 mais taille petite",
                        size: sizes.sample,
                        brand: "sandro",
                        category: "pantalon",
                        value: "15",
                        available: true,
                        condition: condition.sample })
sandro1.owner = User.all.sample
sandro1.save!

sandro2 = Clothe.new({  name: "Pantalon Sandro",
                        description: "Pantalon large Sandro, Fermeture zip côté, 2 poches à l avant et à l’arrière,6 boutons à l avant qui s’ouvrent, Quelques défaut d’usure sur le devant mais peu visible malgré tout",
                        size: sizes.sample,
                        brand: "sandro",
                        category: "pantalon",
                        value: "8",
                        available: true,
                        condition: condition.sample })
sandro2.owner = User.all.sample
sandro2.save!

axel_arigato1 = Clothe.new({  name: "Pantalon Axel Arigato",
                              description: "Pantalon femme, de la marque Axel Arigato (édition Keith Haring), de couleur noire, avec gomme sur le bas.",
                              size: sizes.sample,
                              brand: "Axel Arigato",
                              category: "pantalon",
                              value: "45",
                              available: true,
                              condition: condition.sample })
axel_arigato1.owner = User.all.sample
axel_arigato1.save!

axel_arigato2 = Clothe.new({  name: "Pantalon cargo Axel Arigato",
                              description: "Pantalon cargo beige #homme",
                              size: sizes.sample,
                              brand: "Axel Arigato",
                              category: "pantalon",
                              value: "100",
                              available: true,
                              condition: condition.sample })
axel_arigato2.owner = User.all.sample
axel_arigato2.save!

# CATEGORIE COSTUME

de_fursac1 = Clothe.new({ name: "Veste Croisée 6 sur 1",
                          description: "📣 Découvrez le summum du style français avec cette veste croisée, une pièce emblématique pour tout amateur d'art sartorial ! 📣",
                          size: sizes.sample,
                          brand: "de fursac",
                          category: "costume",
                          value: "75",
                          available: true,
                          condition: condition.sample })
de_fursac1.owner = User.all.sample
de_fursac1.save!

de_fursac2 = Clothe.new({ name: "Blazer noir Canali",
                          description: "très belle veste sport noire (Taille 52) 👔",
                          size: sizes.sample,
                          brand: "de fursac",
                          category: "costume",
                          value: "70",
                          available: true,
                          condition: condition.sample })
de_fursac2.owner = User.all.sample
de_fursac2.save!

boss1 = Clothe.new({  name: "costume rayé hugo boss",
                      description: "- Couleur anthracite rayé, voir photos (la couleur sur les photos se rapproche le plus possible de la réalité mais il se peut qu'il y ai de minimes différences de teintes).
                      - 100% pure laine vierge.
                      - Tissu souple.
                      - Doublure satinée.
                      - Fermeture par 2 boutons.
                      - Manches longues avec poignets boutonnés.
                      - 4 poches extérieures.
                      - 3 poches intérieures.
                      - Fines épaulettes pour un maintien impeccable.
                      - Coupe cintrée.
                      - 2 fentes derrière.
                      - Splendide conception.",
                      size: sizes.sample,
                      brand: "boss",
                      category: "costume",
                      value: "190",
                      available: true,
                      condition: condition.sample })
boss1.owner = User.all.sample
boss1.save!

boss2 = Clothe.new({  name: "Veste Hugo boss",
                      description: "Très bon état",
                      size: sizes.sample,
                      brand: "boss",
                      category: "costume",
                      value: "10",
                      available: true,
                      condition: condition.sample })
boss2.owner = User.all.sample
boss2.save!

calvin_klein1 = Clothe.new({  name: "Veste de costume Noire Calvin",
                              description: "Costume Calvin Klein 50 rayé
                              Costume en parfait état
                              Taille grand, plutôt 52 en veste et 42 en pantalon",
                              size: sizes.sample,
                              brand: "Calvin Klein",
                              category: "costume",
                              value: "30",
                              available: true,
                              condition: condition.sample })
calvin_klein1.owner = User.all.sample
calvin_klein1.save!

calvin_klein2 = Clothe.new({  name: "Veste de costume Calvin Klein",
                              description: "Taille 50
                              Noir
                              Laine super 100
                              Le pantalon ayant un petit accro dans le bas de jambe, il sera donné avec la veste",
                              size: sizes.sample,
                              brand: "Calvin klein",
                              category: "costume",
                              value: "20",
                              available: true,
                              condition: condition.sample })
calvin_klein2.owner = User.all.sample
calvin_klein2.save!

burberry1 = Clothe.new({  name: "Veste de costume classique Burberry",
                          description: "Veste de costume classique à deux boutons. Taille 54 (S).
                          Neuf sans étiquette.",
                          size: sizes.sample,
                          brand: "burberry",
                          category: "costume",
                          value: "25",
                          available: true,
                          condition: condition.sample })
burberry1.owner = User.all.sample
burberry1.save!

burberry2 = Clothe.new({  name: "Veste de costume classique à deux boutons.",
                          description: "🔥État: 9.5/10
                          🔥Taille: L/52

                          Composition : 100% Laine

                          Fabriqué aux USA

                          Largeur épaule à épaule: 47cm
                          Largeur aisselle à aisselle: 55cm
                          Longueur Dos: 85cm
                          Largeur au niveau du bouton: 54cm
                          Longueur de la manche: 64cm

                          Vrl14",
                          size: sizes.sample,
                          brand: "burberry",
                          category: "costume",
                          value: "150",
                          available: true,
                          condition: condition.sample })
burberry2.owner = User.all.sample
burberry2.save!

ralph_lauren1 = Clothe.new({  name: "Blazer",
                              description: "Beau blazer jamais porté, taille L/52",
                              size: sizes.sample,
                              brand: "ralph lauren",
                              category: "costume",
                              value: "22",
                              available: true,
                              condition: condition.sample })
ralph_lauren1.owner = User.all.sample
ralph_lauren1.save!

ralph_lauren1 = Clothe.new({  name: "Le blazer iconique en laine chamoisée",
                              description: "En tant que pièce maîtresse indispensable du look Ralph Lauren, notre blazer Polo emblématique est le résultat de l'application de traditions ancestrales pour des décennies de design impeccable. ",
                              size: sizes.sample,
                              brand: "ralph lauren",
                              category: "costume",
                              value: "300",
                              available: true,
                              condition: condition.sample })
ralph_lauren1.owner = User.all.sample
ralph_lauren1.save!

# ATTACHEMENT DES PHOTOS AUX SEEDS

clothes = Clothe.all

clothes.each do |clothe|
  attach_images_to_clothe(clothe)
  clothe.save!
end
