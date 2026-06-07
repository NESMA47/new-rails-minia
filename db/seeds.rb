PostEditor.destroy_all
Post.destroy_all
Editor.destroy_all
User.destroy_all

user1 = User.create!(name: "Nesma", email: "nesma@iti.com")
user2 = User.create!(name: "Marco", email: "marco@iti.com")

post1 = Post.create!(title: "First Open Source Post", body: "Rails is amazing!", user: user1)
post2 = Post.create!(title: "DevOps and Containers", body: "Docker labs completed successfully.", user: user2)

editor1 = Editor.create!(name: "George")
editor2 = Editor.create!(name: "Abdo")

PostEditor.create!(post: post1, editor: editor1)
PostEditor.create!(post: post1, editor: editor2)
PostEditor.create!(post: post2, editor: editor1)

puts "Database seeded successfully!"