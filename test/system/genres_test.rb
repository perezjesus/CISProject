require "application_system_test_case"

class GenresTest < ApplicationSystemTestCase
  setup do
    @genre = genres(:one)
  end

  test "visiting the index" do
    visit genres_url
    assert_selector "h1", text: "Genres"
  end

  test "should create genre" do
    visit genres_url
    click_on "New genre"

    fill_in "Biography", with: @genre.biography
    fill_in "Book", with: @genre.book_id
    fill_in "Children", with: @genre.children
    fill_in "Comics", with: @genre.comics
    fill_in "Fantasy", with: @genre.fantasy
    fill_in "Fiction", with: @genre.fiction
    fill_in "History", with: @genre.history
    fill_in "Mystery", with: @genre.mystery
    fill_in "Nonfiction", with: @genre.nonfiction
    fill_in "Poetry", with: @genre.poetry
    fill_in "Romance", with: @genre.romance
    fill_in "Youngadult", with: @genre.youngadult
    click_on "Create Genre"

    assert_text "Genre was successfully created"
    click_on "Back"
  end

  test "should update Genre" do
    visit genre_url(@genre)
    click_on "Edit this genre", match: :first

    fill_in "Biography", with: @genre.biography
    fill_in "Book", with: @genre.book_id
    fill_in "Children", with: @genre.children
    fill_in "Comics", with: @genre.comics
    fill_in "Fantasy", with: @genre.fantasy
    fill_in "Fiction", with: @genre.fiction
    fill_in "History", with: @genre.history
    fill_in "Mystery", with: @genre.mystery
    fill_in "Nonfiction", with: @genre.nonfiction
    fill_in "Poetry", with: @genre.poetry
    fill_in "Romance", with: @genre.romance
    fill_in "Youngadult", with: @genre.youngadult
    click_on "Update Genre"

    assert_text "Genre was successfully updated"
    click_on "Back"
  end

  test "should destroy Genre" do
    visit genre_url(@genre)
    click_on "Destroy this genre", match: :first

    assert_text "Genre was successfully destroyed"
  end
end
