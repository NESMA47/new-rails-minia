Post.destroy_all
User.destroy_all

user1 = User.create!(name: "Nesma API", email: "nesma.api@iti.com")
user2 = User.create!(name: "Ahmed API", email: "ahmed.api@iti.com")

Post.create!(title: "API First Post", body: "Testing Rails API mode index endpoint.", user: user1)
Post.create!(title: "Postman Testing", body: "Making sure CRUD operations work fine.", user: user2)

puts "API Database seeded successfully!"