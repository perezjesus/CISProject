require "application_system_test_case"

class WritesTest < ApplicationSystemTestCase
  setup do
    @write = writes(:one)
  end

  test "visiting the index" do
    visit writes_url
    assert_selector "h1", text: "Writes"
  end

  test "should create write" do
    visit writes_url
    click_on "New write"

    fill_in "Author", with: @write.author_id
    fill_in "Book", with: @write.book_id
    fill_in "Role", with: @write.role
    click_on "Create Write"

    assert_text "Write was successfully created"
    click_on "Back"
  end

  test "should update Write" do
    visit write_url(@write)
    click_on "Edit this write", match: :first

    fill_in "Author", with: @write.author_id
    fill_in "Book", with: @write.book_id
    fill_in "Role", with: @write.role
    click_on "Update Write"

    assert_text "Write was successfully updated"
    click_on "Back"
  end

  test "should destroy Write" do
    visit write_url(@write)
    click_on "Destroy this write", match: :first

    assert_text "Write was successfully destroyed"
  end
end
