# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_21_200829) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "task"
    t.integer "prompt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_articles_on_prompt_id"
  end

  create_table "essays", force: :cascade do |t|
    t.text "situation"
    t.text "task"
    t.string "note1"
    t.string "note2"
    t.integer "prompt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_essays_on_prompt_id"
  end

  create_table "listenings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multiple_choices", force: :cascade do |t|
    t.string "question"
    t.string "optionA"
    t.string "optionB"
    t.string "optionC"
    t.string "optionD"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "problem_id", null: false
    t.index ["problem_id"], name: "index_multiple_choices_on_problem_id"
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.string "scopes"
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri"
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "open_clozes", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "problem_id", null: false
    t.index ["problem_id"], name: "index_open_clozes_on_problem_id"
  end

  create_table "problems", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prompts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type"
    t.integer "prompt_type"
    t.integer "writings_count"
  end

  create_table "reading_questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.string "optionA"
    t.string "optionB"
    t.string "optionC"
    t.string "optionD"
    t.integer "reading_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_id"], name: "index_reading_questions_on_reading_id"
  end

  create_table "readings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.text "situation"
    t.text "task"
    t.integer "prompt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_reports_on_prompt_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "task"
    t.integer "prompt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_reviews_on_prompt_id"
  end

  create_table "sentence_transformations", force: :cascade do |t|
    t.string "question"
    t.string "prompt"
    t.string "answer"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "problem_id", null: false
    t.index ["problem_id"], name: "index_sentence_transformations_on_problem_id"
  end

  create_table "text_choices", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "body"
    t.integer "reading_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_id"], name: "index_text_choices_on_reading_id"
  end

  create_table "text_matchings", force: :cascade do |t|
    t.string "title"
    t.text "para1"
    t.text "para2"
    t.text "para3"
    t.text "para4"
    t.string "sub1"
    t.string "sub2"
    t.string "sub3"
    t.string "sub4"
    t.integer "reading_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_id"], name: "index_text_matchings_on_reading_id"
  end

  create_table "text_missings", force: :cascade do |t|
    t.string "title"
    t.string "optionA"
    t.string "optionB"
    t.string "optionC"
    t.string "optionD"
    t.string "optionE"
    t.string "optionF"
    t.string "optionG"
    t.text "body"
    t.integer "reading_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_id"], name: "index_text_missings_on_reading_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "level", default: 0
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "word_formations", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "problem_id", null: false
    t.index ["problem_id"], name: "index_word_formations_on_problem_id"
  end

  create_table "writing_conversations", force: :cascade do |t|
    t.integer "writing_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_writing_conversations_on_user_id"
    t.index ["writing_id"], name: "index_writing_conversations_on_writing_id"
  end

  create_table "writings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "writing_conversations_count"
    t.integer "prompt_id", null: false
    t.integer "state", default: 0
    t.integer "grade", default: 0
    t.index ["prompt_id"], name: "index_writings_on_prompt_id"
    t.index ["user_id"], name: "index_writings_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "prompts"
  add_foreign_key "essays", "prompts"
  add_foreign_key "multiple_choices", "problems"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "open_clozes", "problems"
  add_foreign_key "reading_questions", "readings"
  add_foreign_key "reports", "prompts"
  add_foreign_key "reviews", "prompts"
  add_foreign_key "sentence_transformations", "problems"
  add_foreign_key "text_choices", "readings"
  add_foreign_key "text_matchings", "readings"
  add_foreign_key "text_missings", "readings"
  add_foreign_key "word_formations", "problems"
  add_foreign_key "writing_conversations", "users"
  add_foreign_key "writing_conversations", "writings"
  add_foreign_key "writings", "prompts"
  add_foreign_key "writings", "users"
end
