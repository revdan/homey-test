Project.delete_all
User.delete_all
HistoryItem.delete_all

p = Project.create(name: "Project 1")
Project.create(name: "Project 2")
u = User.create!(name: "John Doe", email: "john@example.com", password: "password", password_confirmation: "password")
u2 = User.create!(name: "Don Joe", email: "don@example.com", password: "password", password_confirmation: "password")

HistoryComment.create(project_id: p.id, body: "My first comment", user_id: u.id)
HistoryStatusChange.create(project_id: p.id, body: "My first status change", user_id: u2.id)
