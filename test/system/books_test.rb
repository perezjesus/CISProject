require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "should create book" do
    visit books_url
    click_on "New book"

    fill_in "Asin", with: @book.asin
    fill_in "Average rating", with: @book.average_rating
    fill_in "Country code", with: @book.country_code
    fill_in "Description", with: @book.description
    fill_in "Format", with: @book.format
    fill_in "Image url", with: @book.image_url
    fill_in "Is ebook", with: @book.is_ebook
    fill_in "Isbn", with: @book.isbn
    fill_in "Isbn13", with: @book.isbn13
    fill_in "Kindle asin", with: @book.kindle_asin
    fill_in "Language code", with: @book.language_code
    fill_in "Link", with: @book.link
    fill_in "Num pages", with: @book.num_pages
    fill_in "Publication day", with: @book.publication_day
    fill_in "Publication month", with: @book.publication_month
    fill_in "Publication year", with: @book.publication_year
    fill_in "Publisher", with: @book.publisher
    fill_in "Ratings count", with: @book.ratings_count
    fill_in "Series", with: @book.series
    fill_in "Text reviews count", with: @book.text_reviews_count
    fill_in "Title", with: @book.title
    fill_in "Title without series", with: @book.title_without_series
    fill_in "Url", with: @book.url
    fill_in "Work", with: @book.work_id
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "should update Book" do
    visit book_url(@book)
    click_on "Edit this book", match: :first

    fill_in "Asin", with: @book.asin
    fill_in "Average rating", with: @book.average_rating
    fill_in "Country code", with: @book.country_code
    fill_in "Description", with: @book.description
    fill_in "Format", with: @book.format
    fill_in "Image url", with: @book.image_url
    fill_in "Is ebook", with: @book.is_ebook
    fill_in "Isbn", with: @book.isbn
    fill_in "Isbn13", with: @book.isbn13
    fill_in "Kindle asin", with: @book.kindle_asin
    fill_in "Language code", with: @book.language_code
    fill_in "Link", with: @book.link
    fill_in "Num pages", with: @book.num_pages
    fill_in "Publication day", with: @book.publication_day
    fill_in "Publication month", with: @book.publication_month
    fill_in "Publication year", with: @book.publication_year
    fill_in "Publisher", with: @book.publisher
    fill_in "Ratings count", with: @book.ratings_count
    fill_in "Series", with: @book.series
    fill_in "Text reviews count", with: @book.text_reviews_count
    fill_in "Title", with: @book.title
    fill_in "Title without series", with: @book.title_without_series
    fill_in "Url", with: @book.url
    fill_in "Work", with: @book.work_id
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "should destroy Book" do
    visit book_url(@book)
    click_on "Destroy this book", match: :first

    assert_text "Book was successfully destroyed"
  end
end
