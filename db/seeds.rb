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


# AUTRES CATEGORIES
# CATEGORIE DEGUISEMENT

puts "début des seeds déguisement"

deguisement1 = Clothe.new({ name: "Costume Mr Indestructible ",
                            description: "M. Incroyable a dû raccrocher les héros en raison d'une demande stupide des civils et a donc décidé d'épouser Elastigirl, de commencer à travailler dans une compagnie d'assurance et d'avoir des petits enfants de super-héros.",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "15",
                            available: true,
                            condition: condition.sample })
deguisement1.owner = User.all.sample
deguisement1.save!

deguisement2 = Clothe.new({ name: "Costume de tortue",
                            description: "Les tortues marines parcourent chaque année jusqu'à 10 000 milles avec toute leur famille. Et le fait est qu’ils parcourent chacun de ces kilomètres avec une bonne attitude ! Imaginez le dernier road trip que vous avez fait avec votre famille.",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "25",
                            available: true,
                            condition: condition.sample })
deguisement2.owner = User.all.sample
deguisement2.save!

deguisement3 = Clothe.new({ name: "Déguisement de lutin pour adultes",
                            description: "Une petite fête n'a jamais fait de mal à personne, surtout quand cette fête est organisée par une bande de lutins tapageurs !",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "20",
                            available: true,
                            condition: condition.sample })
deguisement3.owner = User.all.sample
deguisement3.save!

deguisement4 = Clothe.new({ name: "Déguisement Chat au Chapeau Adulte",
                            description: "Combinaison, Queue, Chapeau",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "25",
                            available: true,
                            condition: condition.sample })
deguisement4.owner = User.all.sample
deguisement4.save!

deguisement5 = Clothe.new({ name: "Perruque et barbe à cheveux longs Merlin Wizard",
                            description: "Transformez-vous comme par magie en grand sorcier avec la perruque et la barbe du costume d'Halloween de Merlin.",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "10",
                            available: true,
                            condition: condition.sample })
deguisement5.owner = User.all.sample
deguisement5.save!

deguisement6 = Clothe.new({ name: "Chemise à manches longues",
                            description: "Pourquoi s'entraîner quand ce Muscle Shirt vous donne des abdominaux et des bras déchirés comme un secondeur de la NFL ? Beaucoup moins cher qu'un abonnement à une salle de sport, notre chemise Muscle ton chair fait de vous le roi du fitness instantané, au moins à partir de la taille.",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "10",
                            available: true,
                            condition: condition.sample })
deguisement6.owner = User.all.sample
deguisement6.save!

deguisement7 = Clothe.new({ name: "Masque halloween",
                            description: "Masque halloween certains fonctionnent avec piles, Neuf, Possible de faire un lot, Taille unique.",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "3",
                            available: true,
                            condition: condition.sample })
deguisement7.owner = User.all.sample
deguisement7.save!

deguisement8 = Clothe.new({ name: "Déguisement Halloween fille squelette gifi",
                            description: "Porté une fois très bon état. Serre tête assorti",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "2",
                            available: true,
                            condition: condition.sample })
    deguisement8.owner = User.all.sample
deguisement8.save!

deguisement9 = Clothe.new({ name: "Déguisement Woody Toy Story Disney Pixar",
                            description: "Découvrez notre incroyable Déguisement Woody inspiré de Toy Story Disney Pixar, spécialement conçu pour les petits aventuriers en herbe âgés de 3 à 4 ans. Plongez votre enfant dans l'univers magique de Toy Story avec ce costume qui éveillera son imagination et le transportera dans le Far West palpitant.",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "7",
                            available: true,
                            condition: condition.sample })
deguisement9.owner = User.all.sample
deguisement9.save!

deguisement10 = Clothe.new({ name: "Robe reine des neiges",
                            description: "Robe reine des neiges en très bon état",
                            size: sizes.sample,
                            brand: "",
                            category: "deguisement",
                            value: "5",
                            available: true,
                            condition: condition.sample })
deguisement10.owner = User.all.sample
deguisement10.save!


# CATEGORIE Manteau

puts "début des seeds manteau"

manteau1 = Clothe.new({ name: "Veste coupe vent Burberry",
                        description: "L’élégance à l’anglaise avec ce coupe vent de la marque burberry en très bon état ",
                        size: sizes.sample,
                        brand: "Burberry",
                        category: "manteau",
                        value: "70",
                        available: true,
                        condition: condition.sample })
manteau1.owner = User.all.sample
manteau1.save!

manteau2 = Clothe.new({ name: "Trench Burberry",
                        description: "Le classique trench de la marque burberry en excellent état.",
                        size: sizes.sample,
                        brand: "Burberry",
                        category: "manteau",
                        value: "155",
                        available: true,
                        condition: condition.sample })
manteau2.owner = User.all.sample
manteau2.save!

manteau3 = Clothe.new({ name: "Max Mara chic",
                        description: "Max Mara Bel état pour cette pièce . Cachemire et laine 90cm de hauteur epaule a epaule 46cm",
                        size: sizes.sample,
                        brand: "Max Mara",
                        category: "manteau",
                        value: "150",
                        available: true,
                        condition: condition.sample })
manteau3.owner = User.all.sample
manteau3.save!

manteau4 = Clothe.new({ name: "Veste de printemps Max Mara",
                        description: "taille bien, en bon état",
                        size: sizes.sample,
                        brand: "Max Mara",
                        category: "manteau",
                        value: "180",
                        available: true,
                        condition: condition.sample })
manteau4.owner = User.all.sample
manteau4.save!

manteau5 = Clothe.new({ name: "Trench avec ceinture beige Stella McCartney",
                        description: "Porté quelque fois, ceinture à la taille, différentes faison de boutonner, très chic, très léger.",
                        size: sizes.sample,
                        brand: "Stella McCartney",
                        category: "manteau",
                        value: "150",
                        available: true,
                        condition: condition.sample })
manteau5.owner = User.all.sample
manteau5.save!

manteau6 = Clothe.new({ name: "Manteau Stella Mccartney",
                        description: "Manteau épais et chaud, long, noir, col montant, fermeture par un bouton, les mêmes boutons sur les manches (par 4), deux poches. Composition : 75%laine et 25% polyamide. En excellent état, taille 50. Marque Stella McCartney  #manteaufemme #manteauhiver #manteaulong #manteauvintage #stellamccartney#stellamccartneymanteau #stellamccartneyfemme",
                        size: sizes.sample,
                        brand: "Stella McCartney",
                        category: "manteau",
                        value: "80",
                        available: true,
                        condition: condition.sample })
manteau6.owner = User.all.sample
manteau6.save!

manteau7 = Clothe.new({ name: "Doudoune mi longue beige taille XXS Michael Kors",
                        description: "En très bon état, porté juste quelques fois.",
                        size: sizes.sample,
                        brand: "Michael Kors",
                        category: "manteau",
                        value: "40",
                        available: true,
                        condition: condition.sample })
manteau7.owner = User.all.sample
manteau7.save!

manteau8 = Clothe.new({ name: "Trench Vintage femme",
                        description: "trench femme michael Kors ",
                        size: sizes.sample,
                        brand: "Michael Kors",
                        category: "manteau",
                        value: "15",
                        available: true,
                        condition: condition.sample })
manteau8.owner = User.all.sample
manteau8.save!

manteau9 = Clothe.new({ name: "Trench coat Coach",
                        description: "Très peu utilisé et en très bon état Le seul détail est une tache sur le col comme on le voit sur la dernière photo Largeur : 50 cm Longueur : 70 cm #coachcoat #coach",
                        size: sizes.sample,
                        brand: "Coach",
                        category: "manteau",
                        value: "65",
                        available: true,
                        condition: condition.sample })
manteau9.owner = User.all.sample
manteau9.save!

manteau10 = Clothe.new({ name: "Trench Coach en cuir",
                         description: "Porté quelques fois mais intact",
                         size: sizes.sample,
                         brand: "Coach",
                         category: "manteau",
                         value: "50",
                         available: true,
                         condition: condition.sample })
manteau10.owner = User.all.sample
manteau10.save!

# CATEGORIE ACCESSOIRS FEMME

puts "début des seeds accessoires_femmes"

accessoire1 = Clothe.new({ name: "sac à main  Michael Kors",
                          description: "portée pas tout neuf mais peut encore servir",
                          size: sizes.sample,
                          brand: "Michael Kors",
                          category: "accessoires_femme",
                          value: "5",
                          available: true,
                          condition: condition.sample })
accessoire1.owner = User.all.sample
accessoire1.save!

accessoire2 = Clothe.new({ name: "Lunettes rondes",
                           description: "Tres belle lunettes ronde marron mikael korss. Ce n’est pas l’etui d’origine. Je l’ai cassé. Merci à vinted de ne pas supprimer mon annonce. Ce sont des originales. Numero de suivi sur la derniere photo.",
                           size: sizes.sample,
                           brand: "Michael Kors",
                           category: "accessoires_femme",
                           value: "25",
                           available: true,
                           condition: condition.sample })
accessoire2.owner = User.all.sample
accessoire2.save!

accessoire3 = Clothe.new({ name: "Sac Tory Burch",
                           description: "Sac Tory Burch en cuir noir, dans un état impeccable. Ce sac est l'accessoire parfait pour toutes les occasions, qu'il s'agisse d'une journée shopping entre amies ou d'une soirée chic en ville.",
                           size: sizes.sample,
                           brand: "Tory Burch",
                           category: "accessoires_femme",
                           value: "50",
                           available: true,
                          condition: condition.sample })
accessoire3.owner = User.all.sample
accessoire3.save!

accessoire4 = Clothe.new({ name: "Bottine Tory Burch",
                           description: "Superbe paire de bottines Tory Burch en cuir marron, taille 39. Ces bottines sont à la fois élégantes et polyvalentes, parfaites pour compléter n'importe quelle tenue.",
                           size: sizes.sample,
                           brand: "Tory Burch",
                           category: "accessoires_femme",
                           value: "26",
                           available: true,
                           condition: condition.sample })
accessoire4.owner = User.all.sample
accessoire4.save!

accessoire5 = Clothe.new({ name: "Sac à mains noir Longchamp",
                           description: "Sac à mains Longchamp très bon état avec, Housse protection, Toujours rangé dans sa, boîte d’origine, Larg: 35 cm, Haut sans les anses : 25 cm, Anses : 11 cm",
                           size: sizes.sample,
                           brand: "Longchamp",
                           category: "accessoires_femme",
                           value: "30",
                           available: true,
                           condition: condition.sample })
accessoire5.owner = User.all.sample
accessoire5.save!

accesoire6 = Clothe.new({ name: "Sac longchamp en toile rare beige croco",
                          description: "Sac longtemps, Couleur beige camel",
                          size: sizes.sample,
                          brand: "Longchamp",
                          category: "accessoires_femme",
                          value: "28",
                          available: true,
                          condition: condition.sample })
accesoire6.owner = User.all.sample
accesoire6.save!

accesoire7 = Clothe.new({ name: "Bague avec pierre naturelle Agate",
                          description: "Jamais portée et Inoxydable",
                          size: sizes.sample,
                          brand: "Swarovski",
                          category: "accessoires_femme",
                          value: "15",
                          available: true,
                          condition: condition.sample })
accesoire7.owner = User.all.sample
accesoire7.save!

accessoire8 = Clothe.new({ name: "Portefeuille swarovski en cuir rose",
                           description: "Sublime portefeuille Swarovski en cuir rose, dans un état neuf. Ce portefeuille incarne l'élégance et le luxe, avec son cuir de haute qualité et ses détails scintillants en cristal Swarovski.",
                           size: sizes.sample,
                           brand: "Swarovski",
                           category: "accessoires_femme",
                           value: "15",
                           available: true,
                           condition: condition.sample })
accessoire8.owner = User.all.sample
accessoire8.save!

accessoire9 = Clothe.new({ name: "Charm caméléon qui change de couleur neuf",
                           description: "Charm's caméléon qui change de couleur adaptable bracelet Pandora",
                           size: sizes.sample,
                           brand: "Pandora",
                           category: "accessoires_femme",
                           value: "7",
                           available: true,
                           condition: condition.sample })
accessoire9.owner = User.all.sample
accessoire9.save!

accessoire10 = Clothe.new({ name: "Bague Pandora",
                            description: "Cadeau non offert. Tout est neuf et vous pouvez l’offrir en cadeau à votre tour sans problème",
                            size: sizes.sample,
                            brand: "Pandora",
                            category: "accessoires_femme",
                            value: "17",
                            available: true,
                            condition: condition.sample })
accessoire10.owner = User.all.sample
accessoire10.save!

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
