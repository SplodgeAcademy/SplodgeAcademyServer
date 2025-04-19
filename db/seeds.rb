# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create doorkeeper application if one doesn't exist
if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create!(name: "React", redirect_uri: "", scopes: "")
end

# Create test admin and test user accounts
User.create(email: "renn@example.com", name: "Renn", role: User.roles[:admin], password: "password", password_confirmation: "password")
User.create(email: "test@example.com", name: "Test", password: "password", password_confirmation: "password")

# Create test writings and conversations
10.times do |x|
    writing = Writing.create(title: "Title #{x + 1}", body: "Body #{x + 1} words go here IDK", user_id: User.first.id)

    5.times do |y|
        WritingConversation.create(body: "Comment #{y}", user_id: User.second.id, writing_id: writing.id)
    end
end
