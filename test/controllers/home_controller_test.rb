require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'Recipe Land'
    assert_select 'h1', 'Welcome to Recipe Land!'
    assert_select 'p', 'This is a website for sharing all your favourite recipes!'
  end

  test "should get contact" do
    get contact_url
    assert_response :success

    assert_select 'h1', 'Contact Us'
    assert_select 'a', 'Back'
  end

  test "should post request contact but no email" do
    post request_contact_url, params: {contact: {name: "Matthew", message: "Hello"}}

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact - not logged in" do
    post request_contact_url, params: {contact: {name: "Matthew", email: "matthew@me.com", message: "Hello"}}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

  test "should post request contact - logged in" do
    @user = users(:one)
    sign_in @user
    post request_contact_url, params: {contact: {name: "Matthew", email: @user.email, message: "Hello"}}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end
end
