Project.delete_all
User.delete_all

Project.create({name: "Project 1"})
User.create! name: "John Doe", email: "john@example.com", password: "password", password_confirmation: "password"
