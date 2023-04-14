require "test_helper"

class WritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @write = writes(:one)
  end

  test "should get index" do
    get writes_url
    assert_response :success
  end

  test "should get new" do
    get new_write_url
    assert_response :success
  end

  test "should create write" do
    assert_difference("Write.count") do
      post writes_url, params: { write: { author_id: @write.author_id, book_id: @write.book_id, role: @write.role } }
    end

    assert_redirected_to write_url(Write.last)
  end

  test "should show write" do
    get write_url(@write)
    assert_response :success
  end

  test "should get edit" do
    get edit_write_url(@write)
    assert_response :success
  end

  test "should update write" do
    patch write_url(@write), params: { write: { author_id: @write.author_id, book_id: @write.book_id, role: @write.role } }
    assert_redirected_to write_url(@write)
  end

  test "should destroy write" do
    assert_difference("Write.count", -1) do
      delete write_url(@write)
    end

    assert_redirected_to writes_url
  end
end
