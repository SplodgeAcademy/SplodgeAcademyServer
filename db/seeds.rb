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


# Create test prompts, writings and conversations
3.times do |x|
    prompt = Prompt.create(prompt_type: Prompt.prompt_types[:essayType])

    essay = Essay.create(situation: "Situation #{x + 1}", task: "Task #{x + 1}", note1: "Note #{x + 1}", note2: "Note #{x + 1}", prompt: prompt)

    2.times do |y|
        writing = Writing.create(body: "Body #{y + 1} words go here IDK", user_id: User.first.id, prompt: essay.prompt)

        2.times do |z|
            WritingConversation.create(body: "Comment #{z}", user_id: User.second.id, writing_id: writing.id)
        end
    end
end

3.times do |x|
    prompt = Prompt.create(prompt_type: Prompt.prompt_types[:articleType])

    article = Article.create(title: "Title #{x + 1}", task: "Task #{x + 1}",  prompt: prompt)

    2.times do |y|
        writing = Writing.create(body: "Body #{y + 1} words go here IDK", user_id: User.first.id, prompt: article.prompt)

        2.times do |z|
            WritingConversation.create(body: "Comment #{z}", user_id: User.second.id, writing_id: writing.id)
        end
    end
end

3.times do |x|
    prompt = Prompt.create(prompt_type: Prompt.prompt_types[:reportType])

    report = Report.create(situation: "Situation #{x + 1}", task: "Task #{x + 1}",  prompt: prompt)

    2.times do |y|
        writing = Writing.create(body: "Body #{y + 1} words go here IDK", user_id: User.first.id, prompt: report.prompt)

        2.times do |z|
            WritingConversation.create(body: "Comment #{z}", user_id: User.second.id, writing_id: writing.id)
        end
    end
end

3.times do |x|
    prompt = Prompt.create(prompt_type: Prompt.prompt_types[:reviewType])

    review = Review.create(title: "Title #{x + 1}", task: "Task #{x + 1}",  prompt: prompt)

    2.times do |y|
        writing = Writing.create(body: "Body #{y + 1} words go here IDK", user_id: User.first.id, prompt: review.prompt)

        2.times do |z|
            WritingConversation.create(body: "Comment #{z}", user_id: User.second.id, writing_id: writing.id)
        end
    end
end
