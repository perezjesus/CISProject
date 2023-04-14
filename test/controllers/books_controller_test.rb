require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { asin: @book.asin, average_rating: @book.average_rating, country_code: @book.country_code, description: @book.description, format: @book.format, image_url: @book.image_url, is_ebook: @book.is_ebook, isbn: @book.isbn, isbn13: @book.isbn13, kindle_asin: @book.kindle_asin, language_code: @book.language_code, link: @book.link, num_pages: @book.num_pages, publication_day: @book.publication_day, publication_month: @book.publication_month, publication_year: @book.publication_year, publisher: @book.publisher, ratings_count: @book.ratings_count, series: @book.series, text_reviews_count: @book.text_reviews_count, title: @book.title, title_without_series: @book.title_without_series, url: @book.url, work_id: @book.work_id } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { asin: @book.asin, average_rating: @book.average_rating, country_code: @book.country_code, description: @book.description, format: @book.format, image_url: @book.image_url, is_ebook: @book.is_ebook, isbn: @book.isbn, isbn13: @book.isbn13, kindle_asin: @book.kindle_asin, language_code: @book.language_code, link: @book.link, num_pages: @book.num_pages, publication_day: @book.publication_day, publication_month: @book.publication_month, publication_year: @book.publication_year, publisher: @book.publisher, ratings_count: @book.ratings_count, series: @book.series, text_reviews_count: @book.text_reviews_count, title: @book.title, title_without_series: @book.title_without_series, url: @book.url, work_id: @book.work_id } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
