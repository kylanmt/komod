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

# AUTRES CATEGORIES
# .
# .
# .
# .
# .
# ATTACHEMENT DES PHOTOS AUX SEEDS

clothes = Clothe.all

clothes.each do |clothe|
  attach_images_to_clothe(clothe)
  clothe.save!
end
