require 'test_helper'

class ConfirmationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get confirmation_index_url
    assert_response :success
  end

end
