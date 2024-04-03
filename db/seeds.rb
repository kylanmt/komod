Message.destroy_all
ClotheTransaction.destroy_all
User.destroy_all
Clothe.destroy_all
Category.destroy_all


# USERS
puts "création de antoine"
antoine = User.new({ user_name: "Antoine", first_name: "antoine", last_name: "Metzner", email: "haffreinguea@gmail.com", phone_number: "0823456789", address: "49 rue félix Lemoine, 44300, Nantes", password: "123456", ranking: 4 })
antoine.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_antoine.jpg"))
antoine.photo.attach(io: file, filename: "profil_antoine", content_type: "image/jpg")

puts "création de Kylan"
kylan = User.new({ user_name: "Le Kycks", first_name: "Kylan", last_name: "Metzner", email: "kylan.metzner@email.com", phone_number: "0823456789", address: "2 Rue de la Fosse, 44000 Nantes", password: "123456", ranking: 4 })
kylan.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_antoinette.avif"))
kylan.photo.attach(io: file, filename: "profil_antoinette", content_type: "image/avif")

puts "création de Oscar"
oscar = User.new({ user_name: "Oscarabé", first_name: "Oscar", last_name: "Pessans", email: "oscar.pessans@email.com", phone_number: "0734567890", address: "9 rue de Lamoricière, 44000, Nantes", password: "123456", ranking: 3 })
oscar.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_oscarabé.jpg"))
oscar.photo.attach(io: file, filename: "profil_oscarabé", content_type: "image/jpg")

puts "création de Quentin"
quentin = User.new({ user_name: "Quentintin", first_name: "Quentin", last_name: "Moussef", email: "quantin.moussef@email.com", phone_number: "0912345678", address: " 6 rue de la fosse aux lionn, 44000, Nantes", password: "123456", ranking: 3 })
quentin.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_quentintin.jpeg"))
quentin.photo.attach(io: file, filename: "profil_quentintin", content_type: "image/jpeg")

puts "création de Juliette"
juliette = User.new({ user_name: "Juju", first_name: "Juliette", last_name: "Simon", email: "juliette.sion@email.com", phone_number: "0923456789", address: "6 Rue du Couëdic, 44000 Nantes", password: "123456", ranking: 5 })
juliette.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_juliette.avif"))
juliette.photo.attach(io: file, filename: "profil_juliette", content_type: "image/avif")

puts "création de Anna"
anna = User.new({ user_name: "Annana", first_name: "Anna", last_name: "Chelby", email: "anna.chelby@email.com", phone_number: "0634567890", address: "7 Rue du Vieil Hôpital, 44000 Nantes", password: "123456", ranking: 5 })
anna.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_anna.webp"))
anna.photo.attach(io: file, filename: "profil_anna", content_type: "image/webp")

puts "création de Pauline"
pauline = User.new({ user_name: "Paulinette", first_name: "Pauline", last_name: "Assoun", email: "pauline.assoune@email.com", phone_number: "0912345678", address: "8-10 Rue Paul Dubois, 44000 Nantes", password: "123456", ranking: 5 })
pauline.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_pauline.webp"))
pauline.photo.attach(io: file, filename: "profil_pauline", content_type: "image/webp")

puts "création de Justine"
justine = User.new({ user_name: "Justiti", first_name: "Justine", last_name: "Assoun", email: "justine.assoun@email.com", phone_number: "0812345678", address: "13 Rue des Olivettes, 44000 Nantes", password: "123456", ranking: 4 })
justine.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_justine.jpeg"))
justine.photo.attach(io: file, filename: "profil_justine", content_type: "image/jpeg")

puts "création de Emma"
emma = User.new({ user_name: "Emmy", first_name: "Emma", last_name: "Lecombe", email: "emma.lecobe@email.com", phone_number: "0712345678", address: "1 boulevard de la bonne espérence, 44000, Nantes", password: "123456", ranking: 3 })
emma.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_emma.jpeg"))
emma.photo.attach(io: file, filename: "profil_emma", content_type: "image/jpeg")

puts "création de Ismael"
ismael = User.new({ user_name: "Ismakan", first_name: "Ismael", last_name: "Tabyaoui", email: "ismael.tabyaoui@email.com", phone_number: "0612345678", address: "Quai Turenne, 44000 Nantes", password: "123456", ranking: 4})
ismael.save
file = File.open(Rails.root.join("db/seed_images/profils/profil_ismael.jpeg"))
ismael.photo.attach(io: file, filename: "profil_ismael", content_type: "image/jpeg")

hommes = []
hommes << kylan
hommes << oscar
hommes << quentin
hommes << ismael

femmes = []
femmes << juliette
femmes << anna
femmes << pauline
femmes << justine
femmes << emma

# CATGORIES
ski = Category.new({ name: "Vêtements de ski" })
ski.save!

costume = Category.new({ name: "Costume" })
costume.save!

robe = Category.new({ name: "Robe de soirée" })
robe.save!

sweet = Category.new({ name: "Sweet" })
sweet.save!

pantalon = Category.new({ name: "Pantalon" })
pantalon.save!

manteau = Category.new({ name: "Manteau" })
manteau.save!

deguisement = Category.new({ name: "Déguisement" })
deguisement.save!

robemariee = Category.new({ name: "Robe de mariée" })
robemariee.save!

accessoires_homme = Category.new({ name: "Accessoires homme" })
accessoires_homme.save!

accessoires_femme = Category.new({ name: "Accessoires femme" })
accessoires_femme.save!

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
# template.photo.attach(io: file, filename: "nom de l'image sans l'extension", content_type: "image/(extension)")

# POUR UN DOSSIER D'IMAGE

def attach_images_to_clothe(clothe)
  # LE NOM DU PREMIER SOUS-DOSSIER EST CELUI DE SA CATEGORIE
  clothe_category = clothe.category.name.parameterize(separator: '_')

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
puts "Début des seeds ski..."

fusalp1 = Clothe.new({  name: "Veste de Ski Vintage Rouge",
                        description: "Idéale à porter avec un jean en mi saison. quelques défauts, Attention taille un peu petit (36-38)!",
                        size: "M",
                        brand: "fusalp",
                        category: ski,
                        value: "80",
                        available: true,
                        condition: "usé" })
fusalp1.owner = hommes.sample
fusalp1.save!

fusalp2 = Clothe.new({  name: "Manteau de Ski Homme Noir",
                        description: "N'a servi qu’une semaine de ski, tiens très chaud en haute montagne et poche pour le forfait intégré.",
                        size: "M",
                        brand: "fulsalp",
                        category: ski,
                        value: "200",
                        available: true,
                        condition: "comme neuf" })
fusalp2.owner = antoine
fusalp2.save!

northface1 = Clothe.new({ name: "Manteau de Ski Vert",
                          description: "Porté que 2 saisons dans les Alpes Françaises. Taille un peu grand et tiens très chaud en altitude !",
                          size: "M",
                          brand: "the north face",
                          category: ski,
                          value: "140",
                          available: true,
                          condition: "comme neuf" })
northface1.owner = hommes.sample
northface1.save!

northface2 = Clothe.new({ name: "Pantalon Ski orange",
                          description: "serrage ceinture, ouvertures aérations sur les cuisses. traces d'usures sur les chevilles. Taille grand",
                          size: "S",
                          brand: "the north face",
                          category: ski,
                          value: "50",
                          available: true,
                          condition: "usé" })
northface2.owner = hommes.sample
northface2.save!

salomon1 = Clothe.new({ name: "Casque Ski Salomon Noir",
                        description: "couleure noire mat, a des rayures mais il n’y a jamais eu de chutes avec ! Accroche masque (cf photo).",
                        size: "XL",
                        brand: "salomon",
                        category: ski,
                        value: "25",
                        available: true,
                        condition: "usé" })
salomon1.owner = hommes.sample
salomon1.save!

salomon2 = Clothe.new({ name: "Pantalon Ski Salomon jaune ",
                        description: "Pantalon neuf couleur camel/moutarde foncée. Tiens chaud et attention taille grand même pour un XL !",
                        size: "XL",
                        brand: "salomon",
                        category: ski,
                        value: "110",
                        available: true,
                        condition: "comme neuf" })
salomon2.owner = hommes.sample
salomon2.save!

patagonia1 = Clothe.new({ name: "Veste Polaire Patagonia Beige",
                          description: "Achetée au Japon, Taille M pour homme (correspondrait à un L Femme) Polaire mixte très chaude.",
                          size: "M",
                          brand: "patagonia",
                          category: ski,
                          value: "90",
                          available: true,
                          condition: "comme neuf" })
patagonia1.owner = hommes.sample
patagonia1.save!

patagonia2 = Clothe.new({ name: "Veste Patagonia Bleu",
                          description: "Veste parfait pour le trekking, traces d’usures naturelles et super coupe-vent.",
                          size: "S",
                          brand: "patagonia",
                          category: ski,
                          value: "65",
                          available: true,
                          condition: "usé" })
patagonia2.owner = hommes.sample
patagonia2.save!

rossignol1 = Clothe.new({ name: "Pantalon Ski Rossignol noir",
                          description: "Cadeau que je n'ai jamais porté car trop serré à la taille, très chaud et taille juste bien.",
                          size: "L",
                          brand: "rossignol",
                          category: ski,
                          value: "70",
                          available: true,
                          condition: "comme neuf" })
rossignol1.owner = hommes.sample
rossignol1.save!

rossignol2 = Clothe.new({ name: "Manteau Ski Rossignol Bleu ",
                          description: "Portée 3 fois, très bon état, couleur bleu canard. Taille bien pour un XL, très bonne épaisseur.",
                          size: "XL",
                          brand: "rossignol",
                          category: ski,
                          value: "90",
                          available: true,
                          condition: "comme neuf" })
rossignol2.owner = hommes.sample
rossignol2.save!

# # CATEGORIE DEGUISEMENT

puts "Début des seeds déguisement..."

deguisement1 = Clothe.new({ name: "Costume Mr Indestructible ",
                            description: "M. Incroyable a dû raccrocher les héros en raison d'une demande stupide des civils et a donc décidé d'épouser Elastigirl, de commencer à travailler dans une compagnie d'assurance et d'avoir des petits enfants de super-héros.",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "15",
                            available: true,
                            condition: condition.sample })
deguisement1.owner = hommes.sample
deguisement1.save!

deguisement2 = Clothe.new({ name: "Costume de tortue",
                            description: "Les tortues marines parcourent chaque année jusqu'à 10 000 milles avec toute leur famille. Et le fait est qu’ils parcourent chacun de ces kilomètres avec une bonne attitude ! Imaginez le dernier road trip que vous avez fait avec votre famille.",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "25",
                            available: true,
                            condition: condition.sample })
deguisement2.owner = User.all.sample
deguisement2.save!

deguisement3 = Clothe.new({ name: "Déguisement de lutin pour adultes",
                            description: "Une petite fête n'a jamais fait de mal à personne, surtout quand cette fête est organisée par une bande de lutins tapageurs !",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "20",
                            available: true,
                            condition: condition.sample })
deguisement3.owner = User.all.sample
deguisement3.save!

deguisement4 = Clothe.new({ name: "Déguisement Chat au Chapeau Adulte",
                            description: "Combinaison, Queue, Chapeau",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "25",
                            available: true,
                            condition: condition.sample })
deguisement4.owner = User.all.sample
deguisement4.save!

deguisement5 = Clothe.new({ name: "Perruque et barbe à cheveux longs Merlin",
                            description: "Transformez-vous comme par magie en grand sorcier avec la perruque et la barbe du costume d'Halloween de Merlin.",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "10",
                            available: true,
                            condition: condition.sample })
deguisement5.owner = hommes.sample
deguisement5.save!

deguisement6 = Clothe.new({ name: "Faux muscles",
                            description: "Pourquoi s'entraîner quand ce Muscle Shirt vous donne des abdominaux et des bras déchirés comme un secondeur de la NFL ? Beaucoup moins cher qu'un abonnement à une salle de sport, notre chemise Muscle ton chair fait de vous le roi du fitness instantané, au moins à partir de la taille.",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "10",
                            available: true,
                            condition: condition.sample })
deguisement6.owner = hommes.sample
deguisement6.save!

deguisement7 = Clothe.new({ name: "Masque halloween",
                            description: "Masque halloween certains fonctionnent avec piles, Neuf, Possible de faire un lot, Taille unique.",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "3",
                            available: true,
                            condition: condition.sample })
deguisement7.owner = antoine
deguisement7.save!

deguisement8 = Clothe.new({ name: "Déguisement Halloween fille squelette",
                            description: "Porté une fois très bon état. Serre tête assorti",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "2",
                            available: true,
                            condition: condition.sample })
    deguisement8.owner = femmes.sample
deguisement8.save!

deguisement9 = Clothe.new({ name: "Déguisement Woody Toy Story",
                            description: "Découvrez notre incroyable Déguisement Woody inspiré de Toy Story Disney Pixar, spécialement conçu pour les petits aventuriers en herbe âgés de 3 à 4 ans. Plongez votre enfant dans l'univers magique de Toy Story avec ce costume qui éveillera son imagination et le transportera dans le Far West palpitant.",
                            size: sizes.sample,
                            brand: "",
                            category: deguisement,
                            value: "7",
                            available: true,
                            condition: condition.sample })
deguisement9.owner = hommes.sample
deguisement9.save!

deguisement10 = Clothe.new({  name: "Robe reine des neiges",
                              description: "Robe reine des neiges en très bon état",
                              size: sizes.sample,
                              brand: "",
                              category: deguisement,
                              value: "5",
                              available: true,
                              condition: condition.sample })
deguisement10.owner = femmes.sample
deguisement10.save!

# # CATEGORIE MANTEAU

puts "Début des seeds manteau..."

manteau1 = Clothe.new({ name: "Veste coupe vent Burberry",
                        description: "L’élégance à l’anglaise avec ce coupe vent de la marque burberry en très bon état ",
                        size: sizes.sample,
                        brand: "Burberry",
                        category: manteau,
                        value: "70",
                        available: true,
                        condition: condition.sample })
manteau1.owner = hommes.sample
manteau1.save!

manteau2 = Clothe.new({ name: "Trench Burberry",
                        description: "Le classique trench de la marque burberry en excellent état.",
                        size: sizes.sample,
                        brand: "Burberry",
                        category: manteau,
                        value: "155",
                        available: true,
                        condition: condition.sample })
manteau2.owner = antoine
manteau2.save!

manteau3 = Clothe.new({ name: "Max Mara chic",
                        description: "Max Mara Bel état pour cette pièce . Cachemire et laine 90cm de hauteur epaule a epaule 46cm",
                        size: sizes.sample,
                        brand: "Max Mara",
                        category: manteau,
                        value: "150",
                        available: true,
                        condition: condition.sample })
manteau3.owner = femmes.sample
manteau3.save!

manteau4 = Clothe.new({ name: "Veste de printemps Max Mara",
                        description: "taille bien, en bon état",
                        size: sizes.sample,
                        brand: "Max Mara",
                        category: manteau,
                        value: "180",
                        available: true,
                        condition: condition.sample })
manteau4.owner = femmes.sample
manteau4.save!

manteau5 = Clothe.new({ name: "Trench avec ceinture beige Stella McCartney",
                        description: "Porté quelque fois, ceinture à la taille, différentes faison de boutonner, très chic, très léger.",
                        size: sizes.sample,
                        brand: "Stella McCartney",
                        category: manteau,
                        value: "150",
                        available: true,
                        condition: condition.sample })
manteau5.owner = femmes.sample
manteau5.save!

manteau6 = Clothe.new({ name: "Manteau Stella Mccartney",
                        description: "Manteau épais et chaud, long, noir, col montant, fermeture par un bouton, les mêmes boutons sur les manches (par 4), deux poches. Composition : 75%laine et 25% polyamide. En excellent état, taille 50. Marque Stella McCartney  #manteaufemme #manteauhiver #manteaulong #manteauvintage #stellamccartney#stellamccartneymanteau #stellamccartneyfemme",
                        size: sizes.sample,
                        brand: "Stella McCartney",
                        category: manteau,
                        value: "80",
                        available: true,
                        condition: condition.sample })
manteau6.owner = femmes.sample
manteau6.save!

manteau7 = Clothe.new({ name: "Doudoune mi longue beige taille XXS Michael Kors",
                        description: "En très bon état, porté juste quelques fois.",
                        size: sizes.sample,
                        brand: "Michael Kors",
                        category: manteau,
                        value: "40",
                        available: true,
                        condition: condition.sample })
manteau7.owner = femmes.sample
manteau7.save!

manteau8 = Clothe.new({ name: "Trench Vintage femme",
                        description: "trench femme michael Kors ",
                        size: sizes.sample,
                        brand: "Michael Kors",
                        category: manteau,
                        value: "15",
                        available: true,
                        condition: condition.sample })
manteau8.owner = femmes.sample
manteau8.save!

manteau9 = Clothe.new({ name: "Trench coat Coach",
                        description: "Très peu utilisé et en très bon état Le seul détail est une tache sur le col comme on le voit sur la dernière photo Largeur : 50 cm Longueur : 70 cm #coachcoat #coach",
                        size: sizes.sample,
                        brand: "Coach",
                        category: manteau,
                        value: "65",
                        available: true,
                        condition: condition.sample })
manteau9.owner = femmes.sample
manteau9.save!

manteau10 = Clothe.new({  name: "Trench Coach en cuir",
                          description: "Porté quelques fois mais intact",
                          size: sizes.sample,
                          brand: "Coach",
                          category: manteau,
                          value: "50",
                          available: true,
                          condition: condition.sample })
manteau10.owner = femmes.sample
manteau10.save!

# CATEGORIE ACCESSOIRS FEMME

puts "Début des seeds accessoires_femmes..."

accessoire1 = Clothe.new({  name: "sac à main  Michael Kors",
                            description: "portée pas tout neuf mais peut encore servir",
                            size: sizes.sample,
                            brand: "Michael Kors",
                            category: accessoires_femme,
                            value: "5",
                            available: true,
                            condition: condition.sample })
accessoire1.owner = femmes.sample
accessoire1.save!

accessoire2 = Clothe.new({  name: "Lunettes rondes",
                            description: "Tres belle lunettes ronde marron mikael korss. Ce n’est pas l’etui d’origine. Je l’ai cassé. Merci à vinted de ne pas supprimer mon annonce. Ce sont des originales. Numero de suivi sur la derniere photo.",
                            size: sizes.sample,
                            brand: "Michael Kors",
                            category: accessoires_femme,
                            value: "25",
                            available: true,
                            condition: condition.sample })
accessoire2.owner = femmes.sample
accessoire2.save!

accessoire3 = Clothe.new({  name: "Sac Tory Burch",
                            description: "Sac Tory Burch en cuir noir, dans un état impeccable. Ce sac est l'accessoire parfait pour toutes les occasions, qu'il s'agisse d'une journée shopping entre amies ou d'une soirée chic en ville.",
                            size: sizes.sample,
                            brand: "Tory Burch",
                            category: accessoires_femme,
                            value: "50",
                            available: true,
                            condition: condition.sample })
accessoire3.owner = femmes.sample
accessoire3.save!

accessoire4 = Clothe.new({  name: "Bottine Tory Burch",
                            description: "Superbe paire de bottines Tory Burch en cuir marron, taille 39. Ces bottines sont à la fois élégantes et polyvalentes, parfaites pour compléter n'importe quelle tenue.",
                            size: sizes.sample,
                            brand: "Tory Burch",
                            category: accessoires_femme,
                            value: "26",
                            available: true,
                            condition: condition.sample })
accessoire4.owner = femmes.sample
accessoire4.save!

accessoire5 = Clothe.new({  name: "Sac à mains noir Longchamp",
                            description: "Sac à mains Longchamp très bon état avec, Housse protection, Toujours rangé dans sa, boîte d’origine, Larg: 35 cm, Haut sans les anses : 25 cm, Anses : 11 cm",
                            size: sizes.sample,
                            brand: "Longchamp",
                            category: accessoires_femme,
                            value: "30",
                            available: true,
                            condition: condition.sample })
accessoire5.owner = femmes.sample
accessoire5.save!

accesoire6 = Clothe.new({ name: "Sac longchamp en toile rare beige croco",
                          description: "Sac longtemps, Couleur beige camel",
                          size: sizes.sample,
                          brand: "Longchamp",
                          category: accessoires_femme,
                          value: "28",
                          available: true,
                          condition: condition.sample })
accesoire6.owner = femmes.sample
accesoire6.save!

accesoire7 = Clothe.new({ name: "Bague avec pierre naturelle Agate",
                          description: "Jamais portée et Inoxydable",
                          size: sizes.sample,
                          brand: "Swarovski",
                          category: accessoires_femme,
                          value: "15",
                          available: true,
                          condition: condition.sample })
accesoire7.owner = femmes.sample
accesoire7.save!

accessoire8 = Clothe.new({  name: "Portefeuille swarovski en cuir rose",
                            description: "Sublime portefeuille Swarovski en cuir rose, dans un état neuf. Ce portefeuille incarne l'élégance et le luxe, avec son cuir de haute qualité et ses détails scintillants en cristal Swarovski.",
                            size: sizes.sample,
                            brand: "Swarovski",
                            category: accessoires_femme,
                            value: "15",
                            available: true,
                            condition: condition.sample })
accessoire8.owner = femmes.sample
accessoire8.save!

accessoire9 = Clothe.new({  name: "Charm caméléon qui change de couleur neuf",
                            description: "Charm's caméléon qui change de couleur adaptable bracelet Pandora",
                            size: sizes.sample,
                            brand: "Pandora",
                            category: accessoires_femme,
                            value: "7",
                            available: true,
                            condition: condition.sample })
accessoire9.owner = femmes.sample
accessoire9.save!

accessoire10 = Clothe.new({ name: "Bague Pandora",
                            description: "Cadeau non offert. Tout est neuf et vous pouvez l’offrir en cadeau à votre tour sans problème",
                            size: sizes.sample,
                            brand: "Pandora",
                            category: accessoires_femme,
                            value: "17",
                            available: true,
                            condition: condition.sample })
accessoire10.owner = femmes.sample
accessoire10.save!

# CATEGORIE ROBE
maje1 = Clothe.new({  name: "Robe asymétrique Maje",
                      description: "Robe Maje bleue. Le col est asymétrique et a effet drapé. ",
                      size: "S",
                      brand: "maje",
                      category: robe,
                      value: "40",
                      available: true,
                      condition: condition.sample })
maje1.owner = femmes.sample
maje1.save!

maje2 = Clothe.new({  name: "Robe noire",
                      description: "Robe neuve avec étiquette en taille S. Cette robe provient d’une boutique MAJE et est noire avec des pois en matière style velours et petits strass brillant argentées avec des bretelles reliées par le logo dorée. Il y a une doublure et des ouvertures sur les côtés.  ",
                      size: sizes.sample,
                      brand: "maje",
                      category: robe,
                      value: "80",
                      available: true,
                      condition: condition.sample })
maje2.owner = femmes.sample
maje2.save!

bash1 = Clothe.new({  name: "Robe Bash noire et dorée",
                      description: "Robe courte noire et dorée de chez Bash En parfait état  Parfaite pour une soirée ou un réveillon",
                      size: sizes.sample,
                      brand: "bash",
                      category: robe,
                      value: "60",
                      available: true,
                      condition: condition.sample })
bash1.owner = femmes.sample
bash1.save!

bash2 = Clothe.new({  name: "Magnifique robe bash",
                      description: "Bonjour, Je fais un énorme tri dans dans nos dressings !n’hésitez pas à vous abonner ! :) Magnifique robe long Ba&sh. Longue style portefeuille, très agréable à porter et beau rendu à la marche puisque fluide. Je fais 1m70. Robe de soirée ou de tous les jours avec un perfecto et des Docs ;)  État neuf portée une fois.",
                      size: sizes.sample,
                      brand: "bash",
                      category: robe,
                      value: "50",
                      available: true,
                      condition: condition.sample })
bash2.owner = femmes.sample
bash2.save!

valentino1 = Clothe.new({ name: "Robe de soirée rare Valentino",
                          description: "La robe est une taille 38 IT/ 36 FR et c'est comme neuf. Plus de photos en mp si demandé sans souci. Cette robe est parfaite pour une celebration de nouvel an ou un gala. 100% authentique",
                          size: sizes.sample,
                          brand: "valentino",
                          category: robe,
                          value: "1000",
                          available: true,
                          condition: condition.sample })
valentino1.owner = femmes.sample
valentino1.save!

valentino2 = Clothe.new({ name: "Robe de soirée Valentino",
                          description: "Robe vintage Valentino en mélange de viscose, acétate et élasthanne. La longueur est de 150 cm, poitrine 42, taille 30, hanches 42. Je précise que la doublure intérieure a été préalablement raccourcie et je signale également quelques fils tirés près de l'étiquette et quelques marques en bas de la robe. A rafraîchir. En très bon état général.",
                          size: sizes.sample,
                          brand: "valentino",
                          category: robe,
                          value: "850",
                          available: true,
                          condition: condition.sample })
valentino2.owner = femmes.sample
valentino2.save!

louis_vuitton1 = Clothe.new({ name: "Robe drapée Louis Vuitton",
                              description: "Couleur Champagne, en viscose souple, avec un joli détail en cordage sur le devant.",
                              size: sizes.sample,
                              brand: "louis vuitton",
                              category: robe,
                              value: "450",
                              available: true,
                              condition: condition.sample })
louis_vuitton1.owner = femmes.sample
louis_vuitton1.save!

louis_vuitton2 = Clothe.new({ name: "Robe Louis Vuitton coupe ample",
                              description: "Robe élégante portée une fois",
                              size: sizes.sample,
                              brand: "louis vuitton",
                              category: robe,
                              value: "700",
                              available: true,
                              condition: condition.sample })
louis_vuitton2.owner = femmes.sample
louis_vuitton2.save!

prada1 = Clothe.new({ name: "Robe élégante",
                      description: "Robe éléguante en soie avec plissé, taille petit , sans fermeture éclaire",
                      size: sizes.sample,
                      brand: "prada",
                      category: robe,
                      value: "250",
                      available: true,
                      condition: condition.sample })
prada1.owner = femmes.sample
prada1.save!

prada2 = Clothe.new({ name: "Robe Prada",
                      description: "Robe texturé noire, avec des strass. ",
                      size: sizes.sample,
                      brand: "prada",
                      category: robe,
                      value: "550",
                      available: true,
                      condition: condition.sample })
prada2.owner = femmes.sample
prada2.save!

# # CATEGORIE PANTALON

wrangler1 = Clothe.new({  name: "Jean Wrangler bleu",
                          description: "pantalon work pants denim jean large charpentier carpenter baggy coupe droite hiver trousser france campagne street sport skate vieux old travail young vintage jolie soins rare grand american us usa etasunis Amérique fripe ville européen long unis motifs basique classe ",
                          size: sizes.sample,
                          brand: "wrangler",
                          category: pantalon,
                          value: "10",
                          available: true,
                          condition: condition.sample })
wrangler1.owner = femmes.sample
wrangler1.save!

wrangler2 = Clothe.new({  name: "Jean Wrangler bleu clair",
                          description: "pantalon work pants denim jean large charpentier carpenter baggy coupe droite hiver trousser france campagne street sport skate vieux old travail young vintage jolie soins rare grand american us usa etasunis Amérique fripe ville européen long unis ",
                          size: sizes.sample,
                          brand: "wrangler",
                          category: pantalon,
                          value: "8",
                          available: true,
                          condition: condition.sample })
wrangler2.owner = hommes.sample
wrangler2.save!

carhartt1 = Clothe.new({  name: "Pantalon Carhartt",
                          description: "Pantalon carhartt - usure normale taille 26 x 30",
                          size: sizes.sample,
                          brand: "carhartt",
                          category: pantalon,
                          value: "15",
                          available: true,
                          condition: condition.sample })
carhartt1.owner = hommes.sample
carhartt1.save!

carhartt2 = Clothe.new({  name: "pantalon beige",
                          description: "taille bien",
                          size: sizes.sample,
                          brand: "carhartt",
                          category: pantalon,
                          value: "20",
                          available: true,
                          condition: condition.sample })
carhartt2.owner = femmes.sample
carhartt2.save!

levis1 = Clothe.new({   name: "Jean Levis femme 524 too superlow",
                        description: "Explorez l'ultime révolution de la mode avec notre Jean Levis femme 524 Too Superlow, la pièce incontournable qui fusionne l'extravagance et le confort. Conçu pour les âmes audacieuses, ce jean incarne la définition même du style avant-gardiste.",
                        size: sizes.sample,
                        brand: "levis",
                        category: pantalon,
                        value: "27",
                        available: true,
                        condition: condition.sample })
levis1.owner = femmes.sample
levis1.save!

levis2 = Clothe.new({   name: "Jean Levis usé",
                        description: "Jean légèrement usé vers le bas. Taille 34. Jean taille basse légèrement évasé.",
                        size: sizes.sample,
                        brand: "levis",
                        category: pantalon,
                        value: "10",
                        available: true,
                        condition: condition.sample })
levis2.owner = femmes.sample
levis2.save!

sandro1 = Clothe.new({  name: "Pantalon Sandro Paris",
                        description: "Acheter sur Vinted taille 40 mais taille petite",
                        size: sizes.sample,
                        brand: "sandro",
                        category: pantalon,
                        value: "15",
                        available: true,
                        condition: condition.sample })
sandro1.owner = femmes.sample
sandro1.save!

sandro2 = Clothe.new({  name: "Pantalon Sandro",
                        description: "Pantalon large Sandro, Fermeture zip côté, 2 poches à l avant et à l’arrière,6 boutons à l avant qui s’ouvrent, Quelques défaut d’usure sur le devant mais peu visible malgré tout",
                        size: sizes.sample,
                        brand: "sandro",
                        category: pantalon,
                        value: "8",
                        available: true,
                        condition: condition.sample })
sandro2.owner = femmes.sample
sandro2.save!

axel_arigato1 = Clothe.new({  name: "Pantalon Axel Arigato",
                              description: "Pantalon femme, de la marque Axel Arigato (édition Keith Haring), de couleur noire, avec gomme sur le bas.",
                              size: sizes.sample,
                              brand: "Axel Arigato",
                              category: pantalon,
                              value: "45",
                              available: true,
                              condition: condition.sample })
axel_arigato1.owner = femmes.sample
axel_arigato1.save!

axel_arigato2 = Clothe.new({  name: "Pantalon cargo Axel Arigato",
                              description: "Pantalon cargo beige #homme",
                              size: sizes.sample,
                              brand: "Axel Arigato",
                              category: pantalon,
                              value: "100",
                              available: true,
                              condition: condition.sample })
axel_arigato2.owner = hommes.sample
axel_arigato2.save!

# # CATEGORIE COSTUME

de_fursac1 = Clothe.new({ name: "Veste Croisée 6 sur 1",
                          description: "📣 Découvrez le summum du style français avec cette veste croisée, une pièce emblématique pour tout amateur d'art sartorial ! 📣",
                          size: sizes.sample,
                          brand: "de fursac",
                          category: costume,
                          value: "75",
                          available: true,
                          condition: condition.sample })
de_fursac1.owner = hommes.sample
de_fursac1.save!

de_fursac2 = Clothe.new({ name: "Blazer noir Canali",
                          description: "très belle veste sport noire (Taille 52) 👔",
                          size: sizes.sample,
                          brand: "de fursac",
                          category: costume,
                          value: "70",
                          available: true,
                          condition: condition.sample })
de_fursac2.owner = hommes.sample
de_fursac2.save!

boss1 = Clothe.new({  name: "costume rayé hugo boss",
                      description: "- Couleur anthracite rayé, voir photos (la couleur sur les photos se rapproche le plus possible de la réalité mais il se peut qu'il y ai de minimes différences de teintes).
                      - 100% pure laine vierge.
                      - Tissu souple.
                      - Doublure satinée.",
                      size: sizes.sample,
                      brand: "boss",
                      category: costume,
                      value: "190",
                      available: true,
                      condition: condition.sample })
boss1.owner = hommes.sample
boss1.save!

boss2 = Clothe.new({  name: "Veste Hugo boss",
                      description: "Très bon état",
                      size: sizes.sample,
                      brand: "boss",
                      category: costume,
                      value: "10",
                      available: true,
                      condition: condition.sample })
boss2.owner = hommes.sample
boss2.save!

calvin_klein1 = Clothe.new({  name: "Veste de costume Noire Calvin",
                              description: "Costume Calvin Klein 50 rayé
                              Costume en parfait état
                              Taille grand, plutôt 52 en veste et 42 en pantalon",
                              size: sizes.sample,
                              brand: "Calvin Klein",
                              category: costume,
                              value: "30",
                              available: true,
                              condition: condition.sample })
calvin_klein1.owner = hommes.sample
calvin_klein1.save!

calvin_klein2 = Clothe.new({  name: "Veste de costume Calvin Klein",
                              description: "Taille 50
                              Noir
                              Laine super 100
                              Le pantalon ayant un petit accro dans le bas de jambe, il sera donné avec la veste",
                              size: sizes.sample,
                              brand: "Calvin klein",
                              category: costume,
                              value: "20",
                              available: true,
                              condition: condition.sample })
calvin_klein2.owner = hommes.sample
calvin_klein2.save!

burberry1 = Clothe.new({  name: "Veste de costume classique Burberry",
                          description: "Veste de costume classique à deux boutons. Taille 54 (S).
                          Neuf sans étiquette.",
                          size: sizes.sample,
                          brand: "burberry",
                          category: costume,
                          value: "25",
                          available: true,
                          condition: condition.sample })
burberry1.owner = hommes.sample
burberry1.save!

burberry2 = Clothe.new({  name: "Veste de costume classique à deux boutons",
                          description: "🔥État: 9.5/10
                          🔥Taille: L/52

                          Composition : 100% Laine",
                          size: sizes.sample,
                          brand: "burberry",
                          category: costume,
                          value: "150",
                          available: true,
                          condition: condition.sample })
burberry2.owner = hommes.sample
burberry2.save!

ralph_lauren1 = Clothe.new({  name: "Blazer",
                              description: "Beau blazer jamais porté, taille L/52",
                              size: sizes.sample,
                              brand: "ralph lauren",
                              category: costume,
                              value: "22",
                              available: true,
                              condition: condition.sample })
ralph_lauren1.owner = hommes.sample
ralph_lauren1.save!

ralph_lauren2 = Clothe.new({  name: "Le blazer iconique en laine chamoisée",
                              description: "En tant que pièce maîtresse indispensable du look Ralph Lauren, notre blazer Polo emblématique est le résultat de l'application de traditions ancestrales pour des décennies de design impeccable. ",
                              size: sizes.sample,
                              brand: "ralph lauren",
                              category: costume,
                              value: "300",
                              available: true,
                              condition: condition.sample })
ralph_lauren2.owner = hommes.sample
ralph_lauren2.save!

# CATEGORIE SWEET
puts "création des seeds sweet"

sweetralphlauren1 = Clothe.new({  name: "Sweet à capuche Ralph Lauren beige",
                                  description: "Porter quelques fois, reste en très bon état, aucune tache ni trou.",
                                  size: "L",
                                  brand: "raplhlauren",
                                  category: sweet,
                                  value: "60",
                                  available: true,
                                  condition: "comme neuf" })
sweetralphlauren1.owner = hommes.sample
sweetralphlauren1.save!

sweetralphlauren2 = Clothe.new({  name: "Pull Ralph lauren bleu XL",
                                  description: "porté quelques fois mais en très bon état 0 défaut, 100% authentique,  taille XL, logo brodé",
                                  size: "XL",
                                  brand: "ralphlauren",
                                  category: sweet,
                                  value: "45",
                                  available: true,
                                  condition: "comme neuf"})
sweetralphlauren2.owner = hommes.sample
sweetralphlauren2.save!

sweetabercrombie1 = Clothe.new({  name: "Sweet XXL Abercrombie et fitch",
                                  description: "Sweet XXL Abercombie et fitch blanc beige, très bon état",
                                  size: "XXL",
                                  brand: "abercombie",
                                  category: sweet,
                                  value: "20",
                                  available: true,
                                  condition: "comme neuf" })
sweetabercrombie1.owner = hommes.sample
sweetabercrombie1.save!

sweetabercrombie2 = Clothe.new({  name: "Sweet à capuche Abercrombie et fitch",
                                  description: "taille bien , en bon état",
                                  size: "XS",
                                  brand: "abercombie",
                                  category: sweet,
                                  value: "7",
                                  available: true,
                                  condition: "usé" })
sweetabercrombie2.owner = hommes.sample
sweetabercrombie2.save!

sweetlacoste1 = Clothe.new({  name: "Veste lacoste rouge S",
                              description: "Sweet zippé Lacoste Rouge En bon état Taille S Pour plus d'information ou de photo n'hésité pas.",
                              size: "S",
                              brand: "lacoste",
                              category: sweet,
                              value: "45",
                              available: true,
                              condition: "usé" })
sweetlacoste1.owner = hommes.sample
sweetlacoste1.save!

sweetlacoste2 = Clothe.new({  name: "Veste lacoste verte",
                              description: "Sweet à capuche Lacoste vert. En très bon état, porter quelques fois. Facture à l'appui",
                              size: "S",
                              brand: "lacoste",
                              category: sweet,
                              value: "75",
                              available: true,
                              condition: "comme neuf" })
sweetlacoste2.owner = hommes.sample
sweetlacoste2.save!

sweetgucci1 = Clothe.new({  name: "Veste Gucci bleue M",
                            description: "Sweet gucci homme, Taille M. Très peu porté en très bon état aucun défaut",
                            size: "M",
                            brand: "gucci",
                            category: sweet,
                            value: "280",
                            available: true,
                            condition: "comme neuf" })
sweetgucci1.owner = antoine
sweetgucci1.save!

sweetgucci2 = Clothe.new({  name: "Sweet Gucci noir Tigre",
                            description: "Sweet Gucci Made in Italy , très bon état",
                            size: "L",
                            brand: "gucci",
                            category: sweet,
                            value: "225",
                            available: true,
                            condition: "comme neuf" })
sweetgucci2.owner = hommes.sample
sweetgucci2.save!

sweetsaintjames1 = Clothe.new({ name: "Pull rayé Saint James T3XL",
                                description: "Très bel état, tout petit défaut à un poignet. Largeur épaules 56 cm. Largeur aisselles 68 cm. Longueur 70 cm",
                                size: "XXXL",
                                brand: "saintjames",
                                category: sweet,
                                value: "42",
                                available: true,
                                condition: "comme neuf" })
sweetsaintjames1.owner = hommes.sample
sweetsaintjames1.save!

sweetsaintjames2 = Clothe.new({ name: "Pull vintage saint james",
                                description: "Pull vintage saintiamesvintage à rayures",
                                size: "M",
                                brand: "saintjames",
                                category: sweet,
                                value: "15",
                                available: true,
                                condition: "usé" })
sweetsaintjames2.owner = hommes.sample
sweetsaintjames2.save!

# CATEGORIE ROBE MARIEE
puts "Création des seeds robe de mariée..."

robemariee1 = Clothe.new({  name: "Robe de mariée portée 1 fois",
                            description: "Robe de mariée
                            Ivoire
                            Mousseline
                            Débardeur
                            Dentelle au dos
                            Portée 1/2 heure pour photos",
                            size: "M",
                            brand: "",
                            category: robemariee,
                            value: "50",
                            available: true,
                            condition: "comme neuf" })
robemariee1.owner = femmes.sample
robemariee1.save!

robemariee2 = Clothe.new({  name: "Belle robe de mariée",
                            description: "Cette robe est un rêve devenu réalité, avec sa silhouette élégante et sa dentelle délicate. La robe présente un corsage ajusté qui met en valeur la silhouette, tandis que la jupe fluide ajoute une touche de grâce et de romantisme.",
                            size: "M",
                            brand: "",
                            category: robemariee,
                            value: "40",
                            available: true,
                            condition: "bon état" })
robemariee2.owner = femmes.sample
robemariee2.save!

robemariee3 = Clothe.new({  name: "Robe longue mariée bohème dentelle",
                            description: "Robe en parfait état.
                            Porter une fois pour une séance photo",
                            size: "M",
                            brand: "",
                            category: robemariee,
                            value: "25",
                            available: true,
                            condition: "comme neuf" })
robemariee3.owner = femmes.sample
robemariee3.save!

robemariee4 = Clothe.new({  name: "Robe Eva e lola",
                            description: "Neuve avec étiquette. Elle est doublée. La couleur est blanc crème",
                            size: "L",
                            brand: "",
                            category: robemariee,
                            value: "20",
                            available: true,
                            condition: "comme neuf" })
robemariee4.owner = femmes.sample
robemariee4.save!

robemariee5 = Clothe.new({  name: "Magnifique Robe de Mariée Blanche",
                            description: "Robe de mariée jamais portée état neuf",
                            size: "M",
                            brand: "",
                            category: robemariee,
                            value: "65",
                            available: true,
                            condition: "comme neuf"})
robemariee5.owner = femmes.sample
robemariee5.save!

robemariee6 = Clothe.new({  name: "Robe Sibylle – Sincerity",
                            description: "Sibylle est une robe de forme A-line, de couleur ivoire. Elle se compose d’un corsage en dentelle de Chantilly recouvert de perles et d’une jupe en tulle. La traîne chapelle donne du charme à la robe. Sibylle est une robe résolument romantique !",
                            size: "M",
                            brand: "",
                            category: robemariee,
                            value: "90",
                            available: true,
                            condition: "bon état" })
robemariee6.owner = femmes.sample
robemariee6.save!

robemariee7 = Clothe.new({  name: "Elégante robe de mariée",
                            description: "Jade est une robe de style princesse. Le haut est en dentelle et le bas en tulle. La ceinture est amovible. Son laçage permet de l’ajuster facilement. Une robe de mariée à l’allure romantique !",
                            size: "M",
                            brand: "",
                            category: robemariee,
                            value: "80",
                            available: true,
                            condition: "bon état" })
robemariee7.owner = femmes.sample
robemariee7.save!

robemariee8 = Clothe.new({  name: "Robe Pépita – Eglantine",
                            description: "Eléganza est une robe courte, de couleur ivoire. Elle est recouverte de dentelle et agrémentée d’une fine ceinture.",
                            size: "M",
                            brand: "",
                            category: robemariee,
                            value: "70",
                            available: true,
                            condition: "comme neuf" })
robemariee8.owner = femmes.sample
robemariee8.save!

robemariee9 = Clothe.new({  name: "Robe Vietnam – Eglantine Créations",
                            description: "Vietnam est une robe fluide et délicate de couleur ivoire. Le bustier semi-transparent est couvert de fleurs.  Avec sa taille joliment marquée d’une ceinture, cette robe flattera la silhouettes.",
                            size: "M",
                            brand: "",
                            category: robemariee,
                            value: "60",
                            available: true,
                            condition: "bon état" })
robemariee9.owner = femmes.sample
robemariee9.save!

robemariee10 = Clothe.new({ name: "Robe Vaucluse – Eglantine",
                            description: "Vaucluse est une robe fluide en mousseline de couleur ivoire. Son corsage à bretelles en guipure florale met en valeur son joli décolleté en V. Sa jupe légèrement évasée se termine par une courte traîne. Son atout charme c’est son dos en transparence !",
                            size: "S",
                            brand: "",
                            category: robemariee,
                            value: "75",
                            available: true,
                            condition: "bon état" })
robemariee10.owner = femmes.sample
robemariee10.save!

# CATEGORIE ACCESSOIRES HOMME

puts "créations des seeds accessoires hommes"

montrefossil = Clothe.new({ name: "Montre Fossil neuve",
                            description: "Montre fossil
                            Fonction très bien
                            Pile neuve très bon état",
                            size: "M",
                            brand: "Fossil",
                            category: accessoires_homme,
                            value: "52",
                            available: true,
                            condition: "bon état" })
montrefossil.owner = hommes.sample
montrefossil.save!

chaussures1 = Clothe.new({  name: "Chaussures Cole haan taille 45",
                            description: "Chaussures américaines tout terrain Cole Haan taille 44 prix boutique elles coutaient 350€ mais ils ont baissé les maintenant sa tourne au tour de 240 euro",
                            size: "45",
                            brand: "colehaan",
                            category: accessoires_homme,
                            value: "100",
                            available: true,
                            condition: "correct" })
chaussures1.owner = hommes.sample
chaussures1.save!

chaussures2 = Clothe.new({  name: "Chaussures Cole haan original",
                            description: "Chaussures cole haan originale en excellent état porté quelques fois taille 43",
                            size: "43",
                            brand: "colehaan",
                            category: accessoires_homme,
                            value: "29",
                            available: true,
                            condition: "comme neuf" })
chaussures2.owner = antoine
chaussures2.save!

montrefossil2 = Clothe.new({  name: "Montre Fossil bracelet cuire",
                              description: "Montre Fossil la pile est a changer sinon elle tourne normalement. Le bracelet en cuire a un peu travaillé",
                              size: "M",
                              brand: "fossil",
                              category: accessoires_homme,
                              value: "15",
                              available: true,
                              condition: condition.sample })
montrefossil2.owner = hommes.sample
montrefossil2.save!

portefeuille = Clothe.new({ name: "Portefeuille Tommy Hilfiger",
                            description: "Superbe portefeuille Tommy Hilfiger en cuir véritable, parfait pour ajouter une touche de style à votre quotidien. Ce portefeuille présente le logo emblématique de Tommy Hilfiger et offre amplement d'espace pour vos cartes, votre argent liquide et autres petits objets essentiels.",
                            size: "",
                            brand: "tommyhilfiger",
                            category: accessoires_homme,
                            value: "35",
                            available: true,
                            condition: "bon état" })
portefeuille.owner = hommes.sample
portefeuille.save!

ceinture1 = Clothe.new({  name: "Ceinture Tommy Hilfiger",
                          description: "Ceinture apporte une touche de style et d'élégance à toutes vos tenues. Fabriquée avec des matériaux de haute qualité, elle est à la fois durable et tendance. Le logo emblématique de Tommy Hilfiger est discrètement gravé sur la boucle",
                          size: sizes.sample,
                          brand: "tommyhilfiger",
                          category: accessoires_homme,
                          value: "23",
                          available: true,
                          condition: "bon état" })
ceinture1.owner = hommes.sample
ceinture1.save!

montrehugoboss = Clothe.new({ name: "Hugo Boss montre homme",
                              description: "Une montre pour hommes Hugo Boss portée deux fois seulement, dans un état neuf. Elle fonctionne très bien, mais la batterie doit être changée.",
                              size: "",
                              brand: "hugoboss",
                              category: accessoires_homme,
                              value: "80",
                              available: true,
                              condition: condition.sample })
montrehugoboss.owner = hommes.sample
montrehugoboss.save!

cravate = Clothe.new({  name: "Cravate Hugo Boss",
                        description: "Cravate bleue de belle qualité qui mettra en valeur votre costume",
                        size: "",
                        brand: "hugoboss",
                        category: accessoires_homme,
                        value: "40",
                        available: true,
                        condition: condition.sample })
cravate.owner = hommes.sample
cravate.save!


# status = ["new", "pending", "finished"]

puts "création des transactions"
def transaction_status(transaction)
  if Date.today > transaction.end_date
    transaction.status = "finished"
  elsif Date.today < transaction.start_date
    transaction.status = "new"
  else
    transaction.status = "pending"
  end
end

def transaction_creation(user, clothe, start_date, end_date)
  transaction = ClotheTransaction.new(start_date: Date.today + start_date, end_date: Date.today + end_date)
  transaction.client = user
  transaction.clothe = clothe
  transaction.price = transaction.clothe.value
  transaction_status(transaction)
  transaction.chatroom = Chatroom.new(name: "location de #{transaction.clothe.name} par #{transaction.client.user_name}")
  puts transaction.chatroom.name if transaction.save!
end

transaction_creation(antoine, boss1, 2, 3)
transaction_creation(antoine, fusalp1, 15, 23)
transaction_creation(ismael, antoine.clothes.first, 5, 17)
transaction_creation(oscar, antoine.clothes.second, -10, 4)
transaction_creation(quentin, antoine.clothes.third, 0, 13)
transaction_creation(emma, antoine.clothes.fourth, 22, 23)


# ATTACHEMENT DES PHOTOS AUX SEEDS

Clothe.all.each do |clothe|
  puts "charging image for #{clothe.name}"
  attach_images_to_clothe(clothe)
  clothe.save!
end
