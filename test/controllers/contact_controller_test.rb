require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get contact_contact_url
    assert_response :success
  end

end
