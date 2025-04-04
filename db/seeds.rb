# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create!(name: "React", redirect_uri: "", scopes: "")
end

User.create(email: "renn@example.com", name: "Renn", password: "password", password_confirmation: "password")

10.times do |x|
    Writing.create(title: "Title #{x + 1}", body: "Body #{x + 1} words go here IDK", user_id: User.first.id)
end
