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
  create_table "authors", primary_key: "author_id", id: :string, force: :cascade do |t|
    t.decimal "average_rating", precision: 3, scale: 2
    t.integer "text_reviews_count", precision: 38
    t.string "name"
    t.integer "ratings_count", precision: 38
  end

  create_table "books", primary_key: "book_id", id: :string, force: :cascade do |t|
    t.string "isbn"
    t.integer "text_reviews_count", precision: 38
    t.string "series"
    t.string "country_code"
    t.string "language_code"
    t.string "asin"
    t.string "is_ebook"
    t.decimal "average_rating", precision: 3, scale: 2
    t.string "kindle_asin"
    t.string "description", limit: 4000
    t.string "format"
    t.string "link"
    t.string "publisher"
    t.integer "num_pages", precision: 38
    t.integer "publication_day", precision: 38
    t.string "isbn13"
    t.integer "publication_month", precision: 38
    t.integer "publication_year", precision: 38
    t.string "url"
    t.string "image_url"
    t.integer "ratings_count", precision: 38
    t.integer "work_id", precision: 38
    t.string "title"
    t.string "title_without_series"
  end

  create_table "books_json", id: false, force: :cascade do |t|
    t.text "json_data"
  end

  create_table "genres", id: false, force: :cascade do |t|
    t.string "book_id"
    t.string "fiction", limit: 10
    t.string "history", limit: 10
    t.string "fantasy", limit: 10
    t.string "mystery", limit: 10
    t.string "poetry", limit: 10
    t.string "romance", limit: 10
    t.string "nonfiction", limit: 10
    t.string "comics", limit: 10
    t.string "biography", limit: 10
    t.string "youngadult", limit: 10
    t.string "children", limit: 10
  end

  create_table "writes", id: false, force: :cascade do |t|
    t.string "book_id"
    t.string "author_id"
    t.string "role"
  end

  add_foreign_key "genres", "books", primary_key: "book_id", name: "fkey_book_id"
  add_foreign_key "writes", "authors", primary_key: "author_id", name: "fk_author_id"
  add_foreign_key "writes", "books", primary_key: "book_id", name: "fk_book_id"
end
