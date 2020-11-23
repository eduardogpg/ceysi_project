require 'test_helper'

class ShoppingcartsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shoppingcarts_create_url
    assert_response :success
  end

  test "should get show" do
    get shoppingcarts_show_url
    assert_response :success
  end

end
