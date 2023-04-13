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

ActiveRecord::Schema[7.0].define(version: 2023_04_12_234157) do
  create_table "auth_j", id: false, force: :cascade do |t|
    t.text "author_data"
  end

  create_table "authors", id: false, force: :cascade do |t|
    t.string "average_rating", limit: 4000
    t.string "author_id", limit: 4000
    t.string "text_reviews_count", limit: 4000
    t.string "name", limit: 4000
    t.string "ratings_count", limit: 4000
  end

  create_table "books", id: false, force: :cascade do |t|
    t.string "isbn", limit: 4000
    t.string "text_reviews_count", limit: 4000
    t.string "series", limit: 4000
    t.string "country_code", limit: 4000
    t.string "language_code", limit: 4000
    t.string "asin", limit: 4000
    t.string "is_ebook", limit: 4000
    t.string "average_rating", limit: 4000
    t.string "kindle_asin", limit: 4000
    t.string "description", limit: 4000
    t.string "format", limit: 4000
    t.string "link", limit: 4000
    t.string "publisher", limit: 4000
    t.string "num_pages", limit: 4000
    t.string "publication_day", limit: 4000
    t.string "isbn13", limit: 4000
    t.string "publication_month", limit: 4000
    t.string "url", limit: 4000
    t.string "image_url", limit: 4000
    t.string "book_id", limit: 4000
    t.string "ratings_count", limit: 4000
    t.string "work_id", limit: 4000
    t.string "title", limit: 4000
    t.string "title_without_series", limit: 4000
  end

  create_table "books_json", id: false, force: :cascade do |t|
    t.text "json_data"
  end

  create_table "writes", id: false, force: :cascade do |t|
    t.string "book_id", limit: 4000
    t.string "id", limit: 4000
    t.string "rol", limit: 4000
  end

end
