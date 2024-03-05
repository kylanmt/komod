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
antoine.save!

kylan = User.new({ user_name: "Le Kycks", first_name: "Kylan", last_name: "Metzner", email: "kylan.metzner@email.com", phone_number: "0823456789", address: "15 rue du Bellevue, 44000, Nantes", password: "123456", ranking: 2 })
kylan.save

oscar = User.new({ user_name: "Oscarabé", first_name: "Oscar", last_name: "Pessans", email: "oscar.pessans@email.com", phone_number: "0734567890", address: "9 rue de Lamoricière, 44000, Nantes", password: "123456", ranking: 3 })
oscar.save

quentin = User.new({ user_name: "Quentintin", first_name: "Quentin", last_name: "Moussef", email: "quantin.moussef@email.com", phone_number: "0912345678", address: " 6 rue de la fosse aux lionn, 44000, Nantes", password: "123456", ranking: 3 })
quentin.save

juliette = User.new({ user_name: "Juju", first_name: "Juliette", last_name: "Simon", email: "juliette.sion@email.com", phone_number: "0923456789", address: "36 boulevard Jean Leduc, 44300, Nantes", password: "123456", ranking: 5 })
juliette.save

anna = User.new({ user_name: "Annana", first_name: "Anna", last_name: "Chelby", email: "anna.chelby@email.com", phone_number: "0634567890", address: "17 rue de la rivière, 44200, Nantes", password: "123456", ranking: 5 })
anna.save

pauline = User.new({ user_name: "Paulinette", first_name: "Pauline", last_name: "Assoun", email: "pauline.assoune@email.com", phone_number: "0912345678", address: "5 rue du temple,44100 , Nantes", password: "123456", ranking: 5 })
pauline.save

justine = User.new({ user_name: "Justiti", first_name: "Justine", last_name: "Assoun", email: "justine.assoun@email.com", phone_number: "0812345678", address: "95 ruelle du vieux chateau, 44300, Nantes", password: "123456", ranking: 4 })
justine.save

emma = User.new({ user_name: "Emmy", first_name: "Emma", last_name: "Lecombe", email: "emma.lecobe@email.com", phone_number: "0712345678", address: "1 boulevard de la bonne espérence, 44000, Nantes", password: "123456", ranking: 3 })
emma.save

ismael = User.new({ user_name: "Ismakan", first_name: "Ismael", last_name: "Tabyaoui", email: "ismael.tabyaoui@email.com", phone_number: "0612345678", address: "1 boulevard de la boulangerie, 44100, Nantes", password: "123456", ranking: 4})
ismael.save

users = User.all
users_ids = []

users.each do |user|
  users_ids << user.id
end
