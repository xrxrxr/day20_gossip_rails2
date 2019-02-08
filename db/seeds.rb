# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
	city = City.create!(name: Faker::LeagueOfLegends.location,zip_code: Faker::Number.number(5))
end

user = User.create!(first_name: "Anonymous",last_name: "Doe",description: "Discret comme une ombre",age: Faker::Number.number(2),email: Faker::Internet.email,city_id: rand(City.first.id..City.last.id))

10.times do
	user = User.create!(first_name: Faker::Lebowski.character,last_name: Faker::LordOfTheRings.character,description: Faker::Lorem.sentence,age: Faker::Number.number(2),email: Faker::Internet.email,city_id: rand(City.first.id..City.last.id))
end

20.times do
	gossip = Gossip.create!(title: Faker::SiliconValley.app,content: Faker::SiliconValley.motto,user_id: rand(User.first.id..User.last.id))
end

10.times do
	tag = Tag.create!(title: Faker::Book.genre)
end

20.times do |i| #on fait 20 fois car 20 gossips => le i est là pour ça grâce au find()
	rand(Tag.first.id..Tag.last.id).times do #nb aléatoire de tags pour tout Gossip
		join_table_gossip_tag = JoinTableGossipTag.create!(gossip_id: Gossip.find(i+1).id,tag_id: rand(Tag.first.id..Tag.last.id))
	end
end

15.times do
	private_message = PrivateMessage.create!(content: Faker::SiliconValley.motto,sender_id: rand(User.first.id..User.last.id))
	#sender_a = User.find(rand(User.ids.first..User.ids.last))
	#private_message.sender = sender_a
end

25.times do
	join_table_user_private_message = JoinTableUserPrivateMessage.create!(private_message_id: rand(PrivateMessage.first.id..PrivateMessage.last.id),recipient_id: rand(User.first.id..User.last.id))
end

20.times do
	comment = Comment.create!(content: Faker::SiliconValley.motto,user_id: rand(User.first.id..User.last.id),gossip_id: rand(Gossip.first.id..Gossip.last.id))
end

#20.times do |i| #on va aller chercher chacun des gossips
#	comment = Comment.find_by(gossip_id: i+1) #on lui trouve le commentaire associé, car tout les gossip
#	rand(0..Comment.last.id).times do #nb aléatoire de tags pour tout Gossip
#		comment = Comment.create!(content: Faker::SiliconValley.motto,user_id: rand(User.first.id..User.last.id),gossip_id: rand(Gossip.first.id..Gossip.last.id))
#		comment.comments.create!(content: Faker::SiliconValley.motto,user_id: rand(User.first.id..User.last.id),gossip_id: rand(Gossip.first.id..Gossip.last.id))
#	end
#end

Comment.all.each do |comment| #tout commentaire - niveau primary
	rand(0..3).times do #a de 0 à 3 commentaires - niveau secondary - et vive le franglais comme disait Boris Vian
		comment.comments.create!(content: Faker::SiliconValley.motto,user_id: rand(User.first.id..User.last.id),gossip_id: rand(Gossip.first.id..Gossip.last.id))
	end
end

20.times do
	#like = Like.create!(user_id: rand(User.first.id..User.last.id))
	toss = rand(0..1)
	case toss
	when 0
		Gossip.all.sample.likes.create!(user_id: rand(User.first.id..User.last.id))
	when 1
		Comment.all.sample.likes.create!(user_id: rand(User.first.id..User.last.id))
	end
end


