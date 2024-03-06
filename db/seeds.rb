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
condition = ["usé", "bon état", "très bon état", "comme neuf"]

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

# pour antoine -> find . -name "*Zone.Identifier" -type f -delete

# CATEGORIE SKI
puts "création des seeds ski"

fusalp1 = Clothe.new({  name: "Veste Ski Fusalp Vintage Rouge",
                        description: "Idéale à porter avec un jean en mi saison. quelques défauts, Attention taille un peu petit (36-38)!",
                        size: "M",
                        brand: "fusalp",
                        category: "ski",
                        value: "80",
                        available: true,
                        condition: "usé" })
fusalp1.owner = User.all.sample
fusalp1.save!

fusalp2 = Clothe.new({  name: "Manteau Ski Fusalp Homme Noir",
                        description: "A servi qu’une semaine de ski, tiens très chaud en haute montagne et poche pour le forfait intégré.",
                        size: "M",
                        brand: "fulsalp",
                        category: "ski",
                        value: "200",
                        available: true,
                        condition: "comme neuf" })
fusalp2.owner = User.all.sample
fusalp2.save!

northface1 = Clothe.new({ name: "Manteau Ski The North Face Vert",
                          description: "Porté que 2 saisons dans les Alpes Françaises. Taille un peu grand et tiens très chaud en altitude !",
                          size: "M",
                          brand: "the north face",
                          category: "ski",
                          value: "140",
                          available: true,
                          condition: "comme neuf" })
northface1.owner = User.all.sample
northface1.save!

northface2 = Clothe.new({ name: "Pantalon Ski The North Face orange",
                          description: "serrage ceinture, ouvertures aération sur les cuisses. traces d'usures sur les chevilles. Taille grand",
                          size: "S",
                          brand: "the north face",
                          category: "ski",
                          value: "50",
                          available: true,
                          condition: "usé" })
northface2.owner = User.all.sample
northface2.save!

salomon1 = Clothe.new({ name: "Casque Ski Salomon Noir",
                        description: "couleur noir mat, a des rayures mais il n’y a jamais eu de chutes avec ! Accroche masque (cf photo).",
                        size: "XL",
                        brand: "salomon",
                        category: "ski",
                        value: "25",
                        available: true,
                        condition: "usé" })
salomon1.owner = User.all.sample
salomon1.save!

salomon2 = Clothe.new({ name: "Pantalon Ski Salomon jaune ",
                        description: "Pantalon neuf couleur camel/moutarde foncée. Tiens chaud et attention taille grand même pour un XL !",
                        size: "XL",
                        brand: "salomon",
                        category: "ski",
                        value: "110",
                        available: true,
                        condition: "comme neuf"})
salomon2.owner = User.all.sample
salomon2.save!

patagonia1 = Clothe.new({ name: "Veste Polaire Patagonia Beige",
                          description: "Achetée au Japon, Taille M pour homme (correspondrait à un L Femme) Polaire mixte très chaude.",
                          size: "M",
                          brand: "patagonia",
                          category: "ski",
                          value: "90",
                          available: true,
                          condition: "comme neuf" })
patagonia1.owner = User.all.sample
patagonia1.save!

patagonia2 = Clothe.new({ name: "Veste Patagonia Bleu",
                          description: "Veste parfait pour le trekking, traces d’usures naturelles et super coupe-vent.",
                          size: "S",
                          brand: "patagonia",
                          category: "ski",
                          value: "65",
                          available: true,
                          condition: "usé" })
patagonia2.owner = User.all.sample
patagonia2.save!

rossignol1 = Clothe.new({ name: "Pantalon Ski Rossignol noir",
                          description: "Cadeau que je n'ai jamais porté car trop serré à la taille, très chaud et taille juste bien.",
                          size: "L",
                          brand: "rossignol",
                          category: "ski",
                          value: "70",
                          available: true,
                          condition: "comme neuf" })
rossignol1.owner = User.all.sample
rossignol1.save!

rossignol2 = Clothe.new({ name: "Manteau Ski Rossignol Bleu ",
                          description: "Portée 3 fois, très bon état, couleur bleu canard. Taille bien pour un XL, très bonne épaisseur.",
                          size: "XL",
                          brand: "rossignol",
                          category: "ski",
                          value: "90",
                          available: true,
                          condition: "comme neuf" })
rossignol2.owner = User.all.sample
rossignol2.save!

# CATEGORIE SWEET
puts "création des seeds sweet"

sweetralphlauren1 = Clothe.new({  name: "Sweet à capuche Ralph Lauren beige",
                                  description: "Porter quelques fois, reste en très bon état, aucune tache ni trou.",
                                  size: "L",
                                  brand: "raplhlauren",
                                  category: "sweet",
                                  value: "60",
                                  available: true,
                                  condition: "comme neuf" })
sweetralphlauren1.owner = User.all.sample
sweetralphlauren1.save!

sweetralphlauren2 = Clothe.new({  name: "Pull Ralph lauren bleu XL",
                                  description: "porté quelques fois mais en très bon état 0 défaut, 100% authentique,  taille XL, logo brodé",
                                  size: "XL",
                                  brand: "ralphlauren",
                                  category: "sweet",
                                  value: "45",
                                  available: true,
                                  condition: "comme neuf"})
sweetralphlauren2.owner = User.all.sample
sweetralphlauren2.save!

sweetabercrombie1 = Clothe.new({  name: "Sweet XXL Abercrombie et fitch",
                                  description: "Sweet XXL Abercombie et fitch blanc beige, très bon état",
                                  size: "XXL",
                                  brand: "abercombie",
                                  category: "sweet",
                                  value: "20",
                                  available: true,
                                  condition: "comme neuf" })
sweetabercrombie1.owner = User.all.sample
sweetabercrombie1.save!

sweetabercrombie2 = Clothe.new({  name: "Sweet à capuche Abercrombie et fitch",
                                  description: "taille bien , en bon état",
                                  size: "XS",
                                  brand: "abercombie",
                                  category: "sweet",
                                  value: "7",
                                  available: true,
                                  condition: "usé" })
sweetabercrombie2.owner = User.all.sample
sweetabercrombie2.save!

sweetlacoste1 = Clothe.new({  name: "Veste lacoste rouge S",
                              description: "Sweet zippé Lacoste Rouge En bon état Taille S Pour plus d'information ou de photo n'hésité pas.",
                              size: "S",
                              brand: "lacoste",
                              category: "sweet",
                              value: "45",
                              available: true,
                              condition: "usé" })
sweetlacoste1.owner = User.all.sample
sweetlacoste1.save!

sweetlacoste2 = Clothe.new({  name: "Veste lacoste verte",
                              description: "Sweet à capuche Lacoste vert. En très bon état, porter quelques fois. Facture à l'appui",
                              size: "S",
                              brand: "lacoste",
                              category: "sweet",
                              value: "75",
                              available: true,
                              condition: "comme neuf" })
sweetlacoste2.owner = User.all.sample
sweetlacoste2.save!

sweetgucci1 = Clothe.new({  name: "Veste Gucci bleue M",
                            description: "Sweet gucci homme, Taille M. Très peu porté en très bon état aucun défaut",
                            size: "M",
                            brand: "gucci",
                            category: "sweet",
                            value: "280",
                            available: true,
                            condition: "comme neuf" })
sweetgucci1.owner = User.all.sample
sweetgucci1.save!

sweetgucci2 = Clothe.new({  name: "Sweet Gucci noir Tigre",
                            description: "Sweet Gucci Made in Italy , très bon état",
                            size: "L",
                            brand: "gucci",
                            category: "sweet",
                            value: "225",
                            available: true,
                            condition: "comme neuf" })
sweetgucci2.owner = User.all.sample
sweetgucci2.save!

sweetsaintjames1 = Clothe.new({ name: "Pull rayé Saint James T3XL",
                                description: "Très bel état, tout petit défaut à un poignet. Largeur épaules 56 cm. Largeur aisselles 68 cm. Longueur 70 cm",
                                size: "XXXL",
                                brand: "saintjames",
                                category: "sweet",
                                value: "42",
                                available: true,
                                condition: "comme neuf" })
sweetsaintjames1.owner = User.all.sample
sweetsaintjames1.save!

sweetsaintjames2 = Clothe.new({ name: "Pull vintage saint james",
                                description: "Pull vintage saintiamesvintage à rayures

                                Description

                                - taille M

                                - état satisfaisant

                                -Saint James made in France

                                - Couleurs: beige et bleu marine

                                - Boutons col pull

                                - Matière épaisse",
                                size: "M",
                                brand: "saintjames",
                                category: "sweet",
                                value: "15",
                                available: true,
                                condition: "usé" })
sweetsaintjames2.owner = User.all.sample
sweetsaintjames2.save!

# CATEGORIE ROBE MARIEE
puts "création des seeds robe de mariee"

robemariee1 = Clothe.new({  name: "Robe de mariée portée 1 fois",
                            description: "Robe de mariée
                            Ivoire
                            Mousseline
                            Débardeur
                            Dentelle au dos
                            Portée 1/2 heure pour photos",
                            size: "M",
                            brand: "",
                            category: "robemariee",
                            value: "50",
                            available: true,
                            condition: "comme neuf" })
robemariee1.owner = User.all.sample
robemariee1.save!

robemariee2 = Clothe.new({  name: "Belle robe de mariée",
                            description: "Cette robe est un rêve devenu réalité, avec sa silhouette élégante et sa dentelle délicate. La robe présente un corsage ajusté qui met en valeur la silhouette, tandis que la jupe fluide ajoute une touche de grâce et de romantisme.",
                            size: "M",
                            brand: "",
                            category: "robemariee",
                            value: "40",
                            available: true,
                            condition: "bon état" })
robemariee2.owner = User.all.sample
robemariee2.save!

robemariee3 = Clothe.new({  name: "Robe longue mariée bohème dentelle",
                            description: "Robe en parfait état.
                            Porter une fois pour une séance photo",
                            size: "M",
                            brand: "",
                            category: "robemariee",
                            value: "25",
                            available: true,
                            condition: "comme neuf" })
robemariee3.owner = User.all.sample
robemariee3.save!

robemariee4 = Clothe.new({  name: "Robe Eva e lola",
                            description: "Neuve avec étiquette. Elle est doublée. La couleur est blanc crème",
                            size: "L",
                            brand: "",
                            category: "robemariee",
                            value: "20",
                            available: true,
                            condition: "comme neuf" })
robemariee4.owner = User.all.sample
robemariee4.save!

robemariee5 = Clothe.new({  name: "Magnifique Robe de Mariée Blanche",
                            description: "Robe de mariée jamais portée état neuf",
                            size: "M",
                            brand: "",
                            category: "robemariee",
                            value: "65",
                            available: true,
                            condition: "comme neuf"})
robemariee5.owner = User.all.sample
robemariee5.save!

robemariee6 = Clothe.new({  name: "Robe Sibylle – Sincerity",
                            description: "Sibylle est une robe de forme A-line, de couleur ivoire. Elle se compose d’un corsage en dentelle de Chantilly recouvert de perles et d’une jupe en tulle. La traîne chapelle donne du charme à la robe. Sibylle est une robe résolument romantique !",
                            size: "M",
                            brand: "",
                            category: "robemariee",
                            value: "90",
                            available: true,
                            condition: "bon état" })
robemariee6.owner = User.all.sample
robemariee6.save!

robemariee7 = Clothe.new({  name: "Elégante robe de mariée",
                            description: "Jade est une robe de style princesse. Le haut est en dentelle et le bas en tulle. La ceinture est amovible. Son laçage permet de l’ajuster facilement. Une robe de mariée à l’allure romantique !",
                            size: "M",
                            brand: "",
                            category: "robemariee",
                            value: "80",
                            available: true,
                            condition: "bon état" })
robemariee7.owner = User.all.sample
robemariee7.save!

robemariee8 = Clothe.new({  name: "Robe Pépita – Eglantine",
                            description: "Eléganza est une robe courte, de couleur ivoire. Elle est recouverte de dentelle et agrémentée d’une fine ceinture.",
                            size: "M",
                            brand: "",
                            category: "robemariee",
                            value: "70",
                            available: true,
                            condition: "comme neuf" })
robemariee8.owner = User.all.sample
robemariee8.save!

robemariee9 = Clothe.new({ name: "Robe Vietnam – Eglantine Créations",
                        description: "Vietnam est une robe fluide et délicate de couleur ivoire. Le bustier semi-transparent est couvert de fleurs.  Avec sa taille joliment marquée d’une ceinture, cette robe flattera la silhouettes.",
                        size: "M",
                        brand: "",
                        category: "robemariee",
                        value: "60",
                        available: true,
                        condition: "bon état" })
robemariee9.owner = User.all.sample
robemariee9.save!

robemariee10 = Clothe.new({ name: "Robe Vaucluse – Eglantine",
                            description: "Vaucluse est une robe fluide en mousseline de couleur ivoire. Son corsage à bretelles en guipure florale met en valeur son joli décolleté en V. Sa jupe légèrement évasée se termine par une courte traîne. Son atout charme c’est son dos en transparence !",
                            size: "S",
                            brand: "",
                            category: "robemariee",
                            value: "75",
                            available: true,
                            condition: "bon état" })
robemariee10.owner = User.all.sample
robemariee10.save!

# ATTACHEMENT DES PHOTOS AUX SEEDS

clothes = Clothe.all

clothes.each do |clothe|
  puts "charging image for #{clothe.name}"
  attach_images_to_clothe(clothe)
  clothe.save!
end
