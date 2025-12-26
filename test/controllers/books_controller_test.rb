require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_index_url
    assert_response :success
  end

  test "should get new" do
    get books_new_url
    assert_response :success
  end

  test "should get ahow" do
    get books_ahow_url
    assert_response :success
  end
end
