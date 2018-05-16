# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

piece1 = Piece.create(description: "Connecting Bush", price: "0,06€", image: "https://sh-s7-live-s.legocdn.com/is/image/LEGOPCS/6013938?$PABthumb$")
piece2 = Piece.create(description: "Bush", price: "0,06€", image: "https://sh-s7-live-s.legocdn.com/is/image/LEGOPCS/4211573?$PABthumb$")

toy1 = Toy.create(name: "Taj Mahal", numberPieces: "5923", bio: "blah, blah", gender: "For pure man!", price: "329,99€", image: "https://sh-s7-live-s.legocdn.com/is/image//LEGO/10256_alt1?$main$")

toy1.pieces << [piece1,piece2]
